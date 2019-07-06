Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913FE60FA3
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2019 11:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947AB6E1B6;
	Sat,  6 Jul 2019 09:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B82416E147
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 09:30:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B425472167; Sat,  6 Jul 2019 09:30:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 06 Jul 2019 09:30:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shadow.archemage@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-XdupgLWYzk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0351459169=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0351459169==
Content-Type: multipart/alternative; boundary="15624054351.e9a6.9712"
Content-Transfer-Encoding: 7bit


--15624054351.e9a6.9712
Date: Sat, 6 Jul 2019 09:30:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #35 from shadow.archemage@gmail.com ---
(In reply to Mauro Gaspari from comment #22)

> The only issue I have not being able to reproduce the issue quickly, is to
> clearly understand when the issue is resolved by Mesa. It takes hours for=
 me
> to get the freeze sometimes.=20
> If someone has a quick way to trigger system freeze, I am happy to run mo=
re
> tests.

Hi Mauro,

The issue happened to me much more frequently when I opted into Steam beta =
and
ran Monster Hunter: World. Before opting in, the crashes happen around 1-2
hours after the game starts. With Steam beta though, it happens around <5
minutes in.

The only change that I noted when I opted into Steam beta was that the games
suddenly downloaded some shader pre-caching stuff. Unfortunately, I'm not t=
oo
familiar with it, and I'm not too sure if it is related to the problem.

I am running Manjaro, Gnome 3.32.2, Kernel version 5.1.15-1, Mesa 19.1.1.
Let me know if I missed something.

Thanks,
Eph

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15624054351.e9a6.9712
Date: Sat, 6 Jul 2019 09:30:35 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c35">Comme=
nt # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shadow.archemage&#64;gmail.com" title=3D"shadow.archemage&#64;gmail.com">sh=
adow.archemage&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Mauro Gaspari from <a href=3D"show_bug.cgi?id=3D1=
09955#c22">comment #22</a>)

<span class=3D"quote">&gt; The only issue I have not being able to reproduc=
e the issue quickly, is to
&gt; clearly understand when the issue is resolved by Mesa. It takes hours =
for me
&gt; to get the freeze sometimes.=20
&gt; If someone has a quick way to trigger system freeze, I am happy to run=
 more
&gt; tests.</span >

Hi Mauro,

The issue happened to me much more frequently when I opted into Steam beta =
and
ran Monster Hunter: World. Before opting in, the crashes happen around 1-2
hours after the game starts. With Steam beta though, it happens around &lt;5
minutes in.

The only change that I noted when I opted into Steam beta was that the games
suddenly downloaded some shader pre-caching stuff. Unfortunately, I'm not t=
oo
familiar with it, and I'm not too sure if it is related to the problem.

I am running Manjaro, Gnome 3.32.2, Kernel version 5.1.15-1, Mesa 19.1.1.
Let me know if I missed something.

Thanks,
Eph</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15624054351.e9a6.9712--

--===============0351459169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0351459169==--
