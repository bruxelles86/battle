feature 'entering player names' do
  scenario 'Can add player names' do
    sign_in_and_play
    expect(page).to have_content 'Samy VS Will'
  end
end

feature 'checking another player\'s points' do
  scenario 'view player 2\'s hit points' do
    sign_in_and_play
    expect(page).to have_content '100/100'
  end
end

feature 'enables players to attack each other' do
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Will attacked Samy next turn'
  end
end


feature "I want my attack to reduce Player 2's HP by 10" do
  scenario "player 1 takes 10 hp off player 2's total" do
    sign_in_and_play
    click_button('Attack')
    click_button('next turn')
    expect(page).to have_content '90/100'
  end
end

feature "Game should switch players after attacks" do
  scenario "when I hit the attack button" do
    sign_in_and_play
    click_button('Attack')
    click_button('next turn')
    expect(page).to have_content 'Samy\'s turn!'
  end
end

feature "should end the game" do
  scenario "when a player reaches 0 life" do
    sign_in_and_play
    15.times { attack }
    click_button('Attack')
    save_and_open_page
    click_button('End game')
    expect(page).to have_content 'Will wins!'
  end
end
