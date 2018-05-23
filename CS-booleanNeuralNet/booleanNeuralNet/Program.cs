using System;

namespace booleanNeuralNet
{
  class Program
  {
    static void Main(string[] args)
    {
      double desiredResult = 1;
      double learningRate = 0.2;
      double[] inputs = new double[] { 1, 1 };
      double[] weights = new double[] { 0.5, -1 };
      double result = EvalNeuralNet(inputs, weights);
      int neuronOut = Active(result);
      EvalError(result, desiredResult);
      //Console.WriteLine("Result1: {0}. Result2: {1}.",result,result2);
      Console.ReadKey();
    }
    //TODO - make real perceptron.


    //garbage function based on garbage article from garbage frontend developer
    static double EvalNeuralNet(double[] inputs, double[] weights)
    {
      double result = 0;
      for(int i = 0; i < inputs.Length; i++)
      {
        result += (inputs[i] * weights[i]);
      }
      return result;
    }

    static int Active(double sum)
    {
      if (sum > 0)
      {
        return 1;
      }
      return -1;
    }

    static double EvalError(double output, double answer)
    {
      return answer - output;
    }
  }
}
