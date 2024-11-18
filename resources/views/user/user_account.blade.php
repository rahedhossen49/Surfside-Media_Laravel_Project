@extends('layouts.app')

@section('content')

<style>
    .text-danger{
        color:red !important;
    }
</style>
<main class="pt-90">
    <div class="mb-4 pb-4"></div>
    <section class="my-account container">
      <h2 class="page-title">Account Details</h2>
      <div class="row">
        <div class="col-lg-3">
            @include('user.account-nav')
        </div>
        <div class="col-lg-9">
          <div class="page-content my-account__edit">
            @if (Session::has('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ Session::get('success') }}
            </div>
            @endif
            <div class="my-account__edit-form">
              <form name="account_edit_form" action="{{ route('user.user.account') }}" method="POST" class="needs-validation" novalidate="">
                @csrf
                <div class="row">
                  <!-- Full Name -->
                  <div class="col-md-6">
                    <div class="form-floating my-3">
                      <input type="text" class="form-control" placeholder="Full Name" name="name" value="{{ old('name', $user->name) }}" required>
                      <label for="name">Full Name</label>
                    </div>
                    @error('name')
                    <p class="text-danger">{{$message}}</p>
                    @enderror
                  </div>

                  <!-- Mobile Number -->
                  <div class="col-md-12">
                    <div class="form-floating my-3">
                      <input type="text" class="form-control" placeholder="Mobile Number" name="mobile" value="{{ old('mobile', $user->mobile) }}" required>
                      <label for="mobile">Mobile Number</label>
                    </div>
                    @error('mobile')
                    <p class="text-danger">{{$message}}</p>
                    @enderror
                  </div>

                  <!-- Email Address -->
                  <div class="col-md-12">
                    <div class="form-floating my-3">
                      <input type="email" class="form-control" placeholder="Email Address" name="email" value="{{ old('email', $user->email) }}" required>
                      <label for="account_email">Email Address</label>
                    </div>
                    @error('email')
                    <p class="text-danger">{{$message}}</p>
                    @enderror
                  </div>

                  <!-- Password Change Section -->
                  <div class="col-md-12">
                    <div class="my-3">
                      <h5 class="text-uppercase mb-0">Password Change</h5>
                    </div>

                  </div>

                  <!-- Old Password -->
                  <div class="col-md-12">
                    <div class="form-floating my-3">
                      <input type="password" class="form-control" id="old_password" name="old_password" placeholder="Old password">
                      <label for="old_password">Old password</label>
                    </div>
                    @error('old_password')
                    <p class="text-danger">{{$message}}</p>
                    @enderror
                  </div>

                  <!-- New Password -->
                  <div class="col-md-12">
                    <div class="form-floating my-3">
                      <input type="password" class="form-control" id="new_password" name="new_password" placeholder="New password">
                      <label for="account_new_password">New password</label>
                    </div>
                    @error('new_password')
                    <p class="text-danger">{{$message}}</p>
                    @enderror
                  </div>

                  <!-- Confirm New Password -->
                  <div class="col-md-12">
                    <div class="form-floating my-3">
                      <input type="password" class="form-control" id="new_password_confirmation" name="new_password_confirmation" placeholder="Confirm new password">
                      <label for="new_password_confirmation">Confirm new password</label>
                      <div class="invalid-feedback">Passwords did not match!</div>
                    </div>
                    @error('new_password_confirmation')
                    <p class="text-danger">{{$message}}</p>
                    @enderror
                  </div>

                  <!-- Save Changes Button -->
                  <div class="col-md-12">
                    <div class="my-3">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
</main>

@endsection
