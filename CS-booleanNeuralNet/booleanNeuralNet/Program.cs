using System;

namespace booleanNeuralNet
{
  class Program
  {
    static void Main(string[] args)
    {
      double desiredResult = 1;
      Perceptron p = new Perceptron(3);
      //double[] input = { 1, 1, 1 }; //bool1, bool2, bias
      //int result = p.FeedForward(input);
      //Console.WriteLine("Output of percecptron was: {0}", result);
      //EvalError(result, desiredResult);
      //Console.WriteLine("Result1: {0}. Result2: {1}.",result,result2);
      Trainer(10000,p);
      Console.ReadKey();
    }

    //Train to know the logical AND function
    static void Trainer(int runs, Perceptron perc)
    {
      Random rand = new Random();
      int[] inputs = { 0, 0, 0 };
      int answer = 0;
      int result = 0;
      int correctIndex = 0;
      int wrongIndex = 0;
      for (int i = 0; i < runs; i++)
      {
        inputs[0] = rand.Next() % 2;
        inputs[1] = rand.Next() % 2;
        inputs[2] = 1; //bias
        answer = (inputs[0] & inputs[1]); //current can only do & and |. XOR(^) does not work as it is not linearly separable
        result = perc.FeedForward(inputs);
        if (result == answer)
        {
          correctIndex = i;
          Console.WriteLine("Run{0}-Inputs: {1}, {2}. Results: {3}", i, inputs[0], inputs[1], result);
        }
        else
        {
          wrongIndex = i;
          Console.WriteLine("Run{0}-Inputs: {1}, {2}. Results (WRONG): {3}", i, inputs[0], inputs[1], result);
        }
        perc.PrintWeights();
        if (correctIndex > wrongIndex + 100) //stop if it gets it right 100 times in a row
        {
          break;
        }
        perc.Train(inputs, answer);
      }
    }

  }
}
