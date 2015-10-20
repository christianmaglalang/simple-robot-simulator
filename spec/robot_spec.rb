require 'spec_helper'
 
describe Robot do
  before :each do
    @robot = Robot.new 5, 5
  end

  describe ".new" do
    it "returns a Robot object" do
      expect(@robot).to be_an_instance_of Robot
    end
  end

  describe '.place' do
    context 'when x position is greater than limit' do
      let(:place_greater) {@robot.place(7,0,'NORTH')}

      it 'prints error message' do
        expect{place_greater}.to output("Invalid place parameters. Try again.\n").to_stdout
      end

      it 'will not place robot' do
        place_greater
        expect(@robot.coordinate_x).to be_nil
      end
    end

    context 'when x position is negative' do
      let(:place_negative) {@robot.place(-1,0,'NORTH')}

      it 'prints error message' do
        expect{place_negative}.to output("Invalid place parameters. Try again.\n").to_stdout
      end

      it 'will not place robot' do
        place_negative
        expect(@robot.coordinate_x).to be_nil
      end      
    end

    context 'when y position is greater than limit' do
      let(:place_greater) {@robot.place(0,7,'NORTH')}

      it 'prints error message' do
        expect{place_greater}.to output("Invalid place parameters. Try again.\n").to_stdout
      end

      it 'will not place robot' do
        place_greater
        expect(@robot.coordinate_y).to be_nil
      end
    end

    context 'when y position is negative' do
      let(:place_negative) {@robot.place(0,-1,'NORTH')}

      it 'prints error message' do
        expect{place_negative}.to output("Invalid place parameters. Try again.\n").to_stdout
      end

      it 'will not place robot' do
        place_negative
        expect(@robot.coordinate_y).to be_nil
      end
    end

    context 'when facing is invalid' do
      let(:facing_invalid) {@robot.place(0,0,'ABCD')}

      it 'prints error message' do
        expect{facing_invalid}.to output("Invalid place parameters. Try again.\n").to_stdout
      end

      it 'will not place robot' do
        facing_invalid
        expect(@robot.facing).to be_nil
      end
    end

    context 'when parameters are valid' do
      it 'saves location' do
        @robot.place(0,1,'NORTH')
        expect(@robot.coordinate_x).to eq(0)
        expect(@robot.coordinate_y).to eq(1)
        expect(@robot.facing).to eq('NORTH')
      end
    end
  end

  describe '.move' do
    let(:move) {@robot.move}

    context 'to invalid x coordinate' do
      before :each do
        @robot.place(0,0,'WEST')
      end

      it 'prints error message' do
        expect{move}.to output("Robot will fall\n").to_stdout
      end

      it 'retains the location' do
        move
        expect(@robot.coordinate_x).to eq(0)
        expect(@robot.coordinate_y).to eq(0)
        expect(@robot.facing).to eq('WEST')
      end
    end

    context 'to invalid y coordinate' do
      before :each do
        @robot.place(0,0,'SOUTH')
      end

      it 'prints error message' do
        expect{move}.to output("Robot will fall\n").to_stdout
      end

      it 'retains the location' do
        move
        expect(@robot.coordinate_x).to eq(0)
        expect(@robot.coordinate_y).to eq(0)
        expect(@robot.facing).to eq('SOUTH')
      end
    end

    context 'to valid location' do
      it 'saves new location' do
        @robot.place(0,0,'NORTH')
        move
        expect(@robot.coordinate_x).to eq(0)
        expect(@robot.coordinate_y).to eq(1)
        expect(@robot.facing).to eq('NORTH')
      end
    end
  end

  describe '.left' do
    let(:left) {@robot.left}
    
    context 'when coming from NORTH' do
      it 'changes facing to WEST' do
        @robot.place(0,0,'NORTH')
        left
        expect(@robot.facing).to eq('WEST')
      end
    end

    context 'when coming from WEST' do
      it 'changes facing to SOUTH' do
        @robot.place(0,0,'WEST')
        left
        expect(@robot.facing).to eq('SOUTH')
      end
    end

    context 'when coming from SOUTH' do
      it 'changes facing to EAST' do
        @robot.place(0,0,'SOUTH')
        left
        expect(@robot.facing).to eq('EAST')
      end
    end

    context 'when coming from EAST' do
      it 'changes facing to NORTH' do
        @robot.place(0,0,'EAST')
        left
        expect(@robot.facing).to eq('NORTH')
      end
    end
  end

  describe '.right' do
    let(:right) {@robot.right}

    context 'when coming from NORTH' do
      it 'changes facing to EAST' do
        @robot.place(0,0,'NORTH')
        right
        expect(@robot.facing).to eq('EAST')
      end
    end

    context 'when coming from EAST' do
      it 'changes facing to SOUTH' do
        @robot.place(0,0,'EAST')
        right
        expect(@robot.facing).to eq('SOUTH')
      end
    end

    context 'when coming from SOUTH' do
      it 'changes facing to WEST' do
        @robot.place(0,0,'SOUTH')
        right
        expect(@robot.facing).to eq('WEST')
      end
    end

    context 'when coming from WEST' do
      it 'changes facing to NORTH' do
        @robot.place(0,0,'WEST')
        right
        expect(@robot.facing).to eq('NORTH')
      end
    end
  end

  describe '.report' do
    it 'prints the current location' do
      @robot.place(0,0,'NORTH')
      expect{@robot.report}.to output("0,0,NORTH\n").to_stdout
    end
  end
end