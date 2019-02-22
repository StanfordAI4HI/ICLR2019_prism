from __future__ import absolute_import, division, print_function
import torch

from pyro.distributions.torch_distribution import TorchDistributionMixin
from torch.distributions import Categorical

class FloatCategorical(Categorical, TorchDistributionMixin):

    def sample(self, sample_shape=torch.Size()):
        sample_shape = self._extended_shape(sample_shape)
        param_shape = sample_shape + torch.Size((self._num_events,))
        probs = self.probs.expand(param_shape)
        if self.probs.dim() == 1 or self.probs.size(0) == 1:
            probs_2d = probs.view(-1, self._num_events)
        else:
            probs_2d = probs.contiguous().view(-1, self._num_events)
        sample_2d = torch.multinomial(probs_2d, 1, True)
        return sample_2d.contiguous().view(sample_shape).type(torch.FloatTensor)

    def expand(self, batch_shape):
        batch_shape = torch.Size(batch_shape)
        validate_args = self.__dict__.get('validate_args')
        if 'probs' in self.__dict__:
            probs = self.probs.expand(batch_shape + self.probs.shape[-1:])
            return Categorical(probs=probs, validate_args=validate_args)
        else:
            logits = self.logits.expand(batch_shape + self.logits.shape[-1:])
            return Categorical(logits=logits, validate_args=validate_args)
