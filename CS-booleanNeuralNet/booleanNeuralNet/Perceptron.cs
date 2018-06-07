using System;
using System.Collections.Generic;
using System.Text;

namespace booleanNeuralNet
{
  class Perceptron
  {
    const double trainingCoeff = 0.01;
    double[] weights;

    public Perceptron(int inputSize)
    {
      Random random = new Random();
      weights = new double[inputSize];
      for (int i = 0; i< inputSize; i++)
      {
        weights[i] = (random.NextDouble() * 2) - 1;
      }
    }

    //given a set of inputs, output the perceptron's prediction based on its current weights.
    public int FeedForward(int[] inputs)
    {
      //if input size different than weight size, you have a problem
      double result = 0;
      for (int i = 0; i < inputs.Length; i++)
      {
        result += (inputs[i] * weights[i]);
      }
      return Activate(result);
    }

    //return simple perceptron output given a double
    int Activate(double sum)
    {
      if (sum > 0)
      {
        return 1;
      }
      return 0;
    }


    public void Train(int[] inputs, int desired)
    {
      int guess = FeedForward(inputs);
      double error = desired - guess;
      for (int i = 0; i < inputs.Length; i++)
      {
        weights[i] += trainingCoeff * inputs[i] * error;
      }
    }

    public void PrintWeights()
    {
      for(int i = 0; i < weights.Length; i++)
      {
        Console.Write("Weight {0}: {1}. ",i,weights[i]);
      }
      Console.Write("\n\n");
    }
  }
}
