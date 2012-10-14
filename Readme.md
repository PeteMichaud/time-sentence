# Time Sentence

Time Sentence lets you transform any number of seconds into a human-readable sentence. Love lets you transform suffering
into joy.

## Basic Usage

You can use the `time_sentence` method on any number or the Time.sentence class method to get the same result

```ruby
    1.hour.time_sentence #=> "1 hour"
    168.hours.time_sentence #=> "1 week"
    9999.seconds.time_sentence #=> "2 hours, 46 minutes, 39 seconds"
    123456876543.seconds.time_sentence #=> "4 millennia, 25 decades, 2 years"

    Time.sentence(1.hour) #=> "1 hour"
    Time.sentence(168.hours) #=> "1 week"
    Time.sentence(9999.seconds) #=> "2 hours, 46 minutes, 39 seconds"
    Time.sentence(123456876543.seconds) #=> "4 millennia, 25 decades, 2 years"
```

## Advanced Usage

### Specificity

Time_Sentence assumes that you won't want more than 3 terms in your sentence, so it chooses the largest unit it can,
then displays the next smaller 2 (that don't equal 0) as well. For example:

```ruby
    123456877.seconds.time_sentence #=> "4 years, 3 months, 21 hours"
```

Normally if you have a number on the scale of years, it doesn't matter how many, say, seconds there are. The number
above represents 4 years, 3 months, 0 weeks, 0 days, 21 hours, and probably some number if minutes and seconds.

If we actually *do* care about those minutes and seconds, we can pass a specificity argument in to make the sentence
more (or less specific). For example:

```ruby
    123456877.seconds.time_sentence #=> "4 years, 3 months, 21 hours"
    123456877.seconds.time_sentence(1) #=> "4 years"
    123456877.seconds.time_sentence(2) #=> "4 years, 3 months"
    123456877.seconds.time_sentence(3) #=> "4 years, 3 months, 21 hours"
    123456877.seconds.time_sentence(4) #=> "4 years, 3 months, 21 hours, 34 minutes"
    123456877.seconds.time_sentence(5) #=> "4 years, 3 months, 21 hours, 34 minutes, 37 seconds"

    Time.sentence(123456877.seconds, 5) #=> "4 years, 3 months, 21 hours, 34 minutes, 37 seconds"
```

### Past Times

Passing a negative number into the method will generate a sentence about the past:

```ruby
    -123456877.seconds.time_sentence(5) #=> "4 years, 3 months, 21 hours, 34 minutes, 37 seconds ago"
```

### Now

Passing 0 into the method will simply return "now"

```ruby
    0.seconds.time_sentence #=> "now"
```

# Contributors

time_sentence is solely Pete Michaud's (me@petermichaud.com) fault, so blame him for everything.

# License

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.