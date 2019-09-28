Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A9C0F52
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 04:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F6489A6D;
	Sat, 28 Sep 2019 02:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A43B89A6D
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 02:19:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7495C72167; Sat, 28 Sep 2019 02:19:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111750] Navi10 GPU boot bug: Failed to pin framebuffer with
 error -12
Date: Sat, 28 Sep 2019 02:19:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: parkervcp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111750-502-gtsF7De1tX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111750-502@http.bugs.freedesktop.org/>
References: <bug-111750-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1324275785=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1324275785==
Content-Type: multipart/alternative; boundary="15696371931.1D68E.28541"
Content-Transfer-Encoding: 7bit


--15696371931.1D68E.28541
Date: Sat, 28 Sep 2019 02:19:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111750

--- Comment #1 from Michael Parker <parkervcp@gmail.com> ---
I was seeing this issue. After connecting via ssh I was able to get the err=
or
code and found this post.

In the latest update for Fedora 31 Beta (Sept 27, '19) I had a Mesa update =
show
up and it is now working.

Hardware
Ryzen 3700X
Gigabyte X570 I Aorus Pro Wifi
Gigabyte Radeon 5700 XT
LG 27UD58-B 4k Monitors (2 via display port)

Software
Fedora Workstation 31 Beta
Kernel 5.3.1-300.fc31.x86_64
Mesa 19.2.0-1.fc31
LLVM 9.0.0-1.fc31
Cinnamon 4.2.4

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696371931.1D68E.28541
Date: Sat, 28 Sep 2019 02:19:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi10 GPU boot bug: Failed to pin framebuffer with error=
 -12"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111750#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi10 GPU boot bug: Failed to pin framebuffer with error=
 -12"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111750">bug 11175=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
parkervcp&#64;gmail.com" title=3D"Michael Parker &lt;parkervcp&#64;gmail.co=
m&gt;"> <span class=3D"fn">Michael Parker</span></a>
</span></b>
        <pre>I was seeing this issue. After connecting via ssh I was able t=
o get the error
code and found this post.

In the latest update for Fedora 31 Beta (Sept 27, '19) I had a Mesa update =
show
up and it is now working.

Hardware
Ryzen 3700X
Gigabyte X570 I Aorus Pro Wifi
Gigabyte Radeon 5700 XT
LG 27UD58-B 4k Monitors (2 via display port)

Software
Fedora Workstation 31 Beta
Kernel 5.3.1-300.fc31.x86_64
Mesa 19.2.0-1.fc31
LLVM 9.0.0-1.fc31
Cinnamon 4.2.4</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696371931.1D68E.28541--

--===============1324275785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1324275785==--
