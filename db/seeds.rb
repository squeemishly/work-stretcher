class Seed
  def self.run
    new.run
  end

  def run
    generate_users
    generate_stretches
    generate_admin
  end

  def generate_users
    10.times do |i|
      user = User.create(username: "squee#{i}",
                        email: "squee#{i}@squee.com",
                        password: "password")
      puts "User #{i}: #{user.username} has been created"
    end
  end

  def generate_stretches
    body_area1 = BodyArea.create(name: "Legs")
    body_area2 = BodyArea.create(name: "Shoulders")
    body_area3 = BodyArea.create(name: "Neck")
    body_area4 = BodyArea.create(name: "Chest")
    body_area5 = BodyArea.create(name: "Back")

    stretch1 = BodyArea.find(body_area1.id).stretches.create(
                                name: "Standing Hamstring Stretch",
                                description: "Stand one to two feet away from your chair. Place the heel of one foot on your chair and straighten your leg. Keep your hip firmly seated in the hip socket. You should feel the stretch down your hamstrings and potentially in your calves. To increase the intensity of the stretch, lean forward. Make sure that you keep your spine straight as you lean forward.",
                                picture: "http://www.activesportschiro.com/uploads/2/7/6/8/27681893/9762034_orig.jpg")

    stretch1 = BodyArea.find(body_area1.id).stretches.create(
                                name: "Forward Lunge Stretch",
                                description: "Stand with one foot in front of the other in a wide stance. Lower your knee to the floor. Lean forward into your front leg until you feel a stretch in your hips. Your chest should remain perpendicular to the floor. Do not lean forward to support this stretch. If you need more support, move your feet closer together.",
                                picture: "http://www.topendsports.com/medicine/images/lunge-flexor-kneel.gif")

    stretch1 = BodyArea.find(body_area2.id).stretches.create(
                                name: "Crossover Arm Stretch",
                                description: "Stand with your feet shoulder width apart. Cross one arm over your chest. Use the other arm to pull it in tight against your body until you feel a stretch in the rear shoulder and shoulder blade.",
                                picture: "http://orthoinfo.aaos.org/figures/A00071F06.jpg")

    stretch1 = BodyArea.find(body_area2.id).stretches.create(
                                name: "Overhead Shoulder Stretch",
                                description: "Stand with your feet shoulder width apart. Bend one arm and place it behind your neck. Use the other arm to gently pull the elbow of the bent arm in towards the center of your body. Repeat on the other side.",
                                picture: "http://www.physioprescription.com/wp-content/uploads/2013/10/stretch_behind_head_triceps.jpg")

    stretch1 = BodyArea.find(body_area3.id).stretches.create(
                                name: "Seated Neck Release",
                                description: "Sit in a chair with both feet flat on the floor. Contract your abs and slide your shoulder blades down your back to ensure proper posture. Gently drop your head to the right until you feel a stretch in the side of your neck. Let your neck relax in the position, opening the muscle further. For a deeper stretch, use the hand on the same side your head is dropping toward to GENTLY further encourage the stretch. Repeat on the other side.",
                                picture: "http://www.activebodyclinic.com/blog/wp-content/uploads/2012/09/stretch_pic-1_tension-headaches.jpg")

    stretch1 = BodyArea.find(body_area3.id).stretches.create(
                                name: "SCM Massage",
                                description: "Sit in a chair with both feet flat on the floor. Contract your abs and slide your shoulder blades down your back to ensure proper posture. Reach up to the left side of your neck with your right hand. Find the ropy muscle that runs from behind your ear to your collar bone. Squeeze the muscle gently along it's length, following it from one end to the other. Repeat on the other side.",
                                picture: "https://s-media-cache-ak0.pinimg.com/236x/e3/4a/18/e34a1835e7bfcc709dcbbb4652b57291.jpg")

    stretch1 = BodyArea.find(body_area4.id).stretches.create(
                                name: "Broomstick Stretch",
                                description: "Stand with your feet shoulder width apart. Hold a broomstick with arms extended about twice your body width apart. Keeping arms straight, raise the broomstick over your head until you feel a stretch in your chest and shoulders.",
                                picture: "https://media.licdn.com/mpr/mpr/AAEAAQAAAAAAAAllAAAAJGVjMDIxYmM4LTA5MmYtNDczYy1hNDhlLTllNDYxMDk0NTdiYg.png")

    stretch1 = BodyArea.find(body_area4.id).stretches.create(
                                name: "Doorway Stretch",
                                description: "Stand with one foot in front of the other in a doorway. Your hips should be slightly behind the plane of the doorway. Place your hands at shoulder height on either side of the doorframe. Lean forward into your lunge until you feel a stretch in your chest. Hold the stretch until you feel a release in the muscle, then step back out of the doorway. Move your hands up the door frame until your arms are almost parallel to the ground. Repeat the stretch. Do it one more time with your hands extended high enough that your elbows are level with your ears.",
                                picture: "http://abbottcenter.com/bostonpaintherapy/wp-content/uploads/2010/05/doorwaystretch.jpg")

    stretch1 = BodyArea.find(body_area5.id).stretches.create(
                                name: "Iron Cross Stretch",
                                description: "Lay down on the floor with your shoulder blades tucked underneath you and both feet flat on the floor. Press down into your feet to raise your butt up and swing your hips slightly to the right and set them back on the floor. Lower your knees to the ground. When your back and legs feel ready, extend the lower leg until it's straight while the upper remains bent. When you're ready, extend then upper leg to increase the stretch. Your shoulder should always be relaxing towards the floor. Hold until your back and legs release, then bring your legs back so they are bent and your back is still in a twist. Bring your legs around so your feet are flat on the floor. Press down with your feet and bring your hips back flat to the floor. Repeat on the other side.",
                                picture: "https://rideons.files.wordpress.com/2012/10/webtrunk-rotation.jpg")

    stretch1 = BodyArea.find(body_area5.id).stretches.create(
                                name: "Trunk Rotation",
                                description: "Sit in a chair with both feet flat on the floor. Contract your abs and slide your shoulder blades down your back to ensure proper posture. Place your right hand on your left shoulder and your left hand on your right shoulder. Gently twist your body until you feel a stretch down your lats. Do not turn your head to guide the motion. Gently twist to the other side. Repeat until the muscles loosen.",
                                picture: "http://azopt.net/wp-content/uploads/2014/02/trunk-rotate.jpg")
  end

  def generate_admin
    admin = User.create(username: "squee",
                        password: "password",
                        email: "squee@squee.com",
                        role: 1)
  end
end

Seed.run
