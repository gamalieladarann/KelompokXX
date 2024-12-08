def num_converter(num):
    negative = 0
    
    if (num < 0):
        negative = 1
        num = -1*num

    int_part = int(num//1)
    fraction_part = num - int_part

    counter = 0
    frac = []

    while(counter < 15):
        fraction_part = fraction_part * 2
        if(fraction_part >= 1):
            frac.append(1)
            fraction_part = fraction_part%1
        else:
            frac.append(0)
        counter = counter + 1

    frac_string = ''
    for element in frac:
        frac_string = frac_string + str(element)

    temp = '0' + format(int_part,'04b') + frac_string

    if(negative):
        temp = int(temp, 2)
        temp = temp ^ 0xFFFFF
        temp = temp + 0x00001
        temp = format(temp, '020b')

    print(temp)

# weight_input_1 = [1.263785974, 5.630235928, 1.232769029, 5.584236051, -5.207627085, 5.671371356, 1.313899733, 5.613316857, 1.177199493]
# weight_input_2 = [2.796349035, -1.752115415, 2.641188922, -1.852329683, 2.739279802, -1.639939037, 2.890306552, -1.800846325, 2.54989871]
# bias = [4.23291130529554, -0.296417004389852, 4.27220454715769, -0.275480287826872, 0.0995192528391271, -0.317264130174101, 4.20994542599493, -0.287568314226196, 4.29412882859159]


# for (idx, item) in enumerate(weight_input_1):
#     print(f'WEight 1 untuk output {idx+1}')
#     num_converter(item)
#     print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
#     print('                                                        ')
#     print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

num_converter(0.7106)
num_converter(-0.1473)