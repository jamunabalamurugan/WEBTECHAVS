fruits=['Apple','Orange','Kiwi','Datefruit'];

for (let index = 0; index < fruits.length; index++) {
   

    console.log(fruits[index]);
    
}
console.log(fruits.sort());
fruits.push('Woodapple');
fruits.reverse();
console.log(fruits);
function findKiwi()
{
    status=false;
    for (let index = 0; index < fruits.length; index++)
    {
    if(fruits[index]=='Kiwi')
    {
        status=true; 
        console.log('Kiwi is found in fruits array',index)
       //break;
    }
    else
    {
        console.log(fruits[index]);
        status=false;
    }
    }
    console.log('status after for loop',status);
    console.log(typeof status);
    if(status == 'false'){
        var msg="Kiwi is good for Dengue fever";
        console.log('status',status)
    }
    else
    {
        var msg="You can also alternate with Papaya"
    }

        return msg;
    //some operation
}

fruits.pop();
console.log(fruits)

customer={
    name:'Kavin',
    age:10,
    address:'Chennai'
}
var gender;
const address='Thuraipakkam,Chennai';
console.log('address is ',address);
console.log('customer details is ',customer.name,customer.age,customer.address);
console.log(customer)

function add(a,b){
    return a+b;
}
function calcPI(a)
{
    value=Math.PI*a;
    return value; 
}

result=add(6,6);



//console.log(result);
//console.log(calcPI(10));



document.write("<b>Using while loops </b><br />");
		var i = 0, j = 1, k;
		document.write("Fibonacci series less than 40<br />");
		while(i<40)
		{
            document.write(i + "<br />");
            console.log(i);
			k = i+j;
			i = j;
			j = k;
        }

  function calculateDiscount(customerType,totalBillValue)      
  {
      if(customerType=='Platinum'){
          discount=(totalBillValue*3)/100
         
      }else if(customerType=='Gold')
      {
          discount=(totalBillValue*2)/100
         // return discount;
      }
      else
        discount=0;


      discount=discount+50;
      return discount;

    }
//console.log('The discount amount is : Rs.',calculateDiscount('Platinum',1000))
console.log(findKiwi());