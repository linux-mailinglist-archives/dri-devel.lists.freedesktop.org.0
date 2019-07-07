Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030AA614B1
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 12:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB2489861;
	Sun,  7 Jul 2019 10:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BF1589B78
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 10:55:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 985F672167; Sun,  7 Jul 2019 10:55:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 07 Jul 2019 10:55:49 +0000
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
Message-ID: <bug-109955-502-tj8pSqD7PN@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2103000578=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2103000578==
Content-Type: multipart/alternative; boundary="15624969495.1aC8f.16400"
Content-Transfer-Encoding: 7bit


--15624969495.1aC8f.16400
Date: Sun, 7 Jul 2019 10:55:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #37 from shadow.archemage@gmail.com ---
(In reply to Mauro Gaspari from comment #36)
> (In reply to shadow.archemage from comment #35)=20
> I am not an expert, but I am quite sure shaders have a big part in this. =
If
> you can, disable shader caching.
> There are a few tests you can do:
> 1. Did you try with the kernel parameters I posted above? I always ran all
> the parameters together. GPU+CPU and at the time, I did not have crashes =
for
> weeks on my Vega64. I am using a RadeonVII now and it seems those paramet=
ers
> are not needed.

I tried the kernel parameters above, and the game still crashed for me.

> 2. Valve sponsored an interesting project that removes dependency of AMD
> Mesa from LLVM. And instead uses ACO. Valve made this available for Arch
> based systems via AUR, and Ubuntu based system via PPA. If you want to te=
st
> it, you can check the posts below. I am going to test this myself on both
> Arch and Ubuntu.=20
> https://steamcommunity.com/games/221410/announcements/detail/
> 1602634609636894200
> https://steamcommunity.com/app/221410/discussions/0/1640915206474070669/

Will check this out, but will also keep an eye on this thread about the res=
ults
of your tests. Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15624969495.1aC8f.16400
Date: Sun, 7 Jul 2019 10:55:49 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c37">Comme=
nt # 37</a>
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
09955#c36">comment #36</a>)
<span class=3D"quote">&gt; (In reply to shadow.archemage from <a href=3D"sh=
ow_bug.cgi?id=3D109955#c35">comment #35</a>)=20
&gt; I am not an expert, but I am quite sure shaders have a big part in thi=
s. If
&gt; you can, disable shader caching.
&gt; There are a few tests you can do:
&gt; 1. Did you try with the kernel parameters I posted above? I always ran=
 all
&gt; the parameters together. GPU+CPU and at the time, I did not have crash=
es for
&gt; weeks on my Vega64. I am using a RadeonVII now and it seems those para=
meters
&gt; are not needed.</span >

I tried the kernel parameters above, and the game still crashed for me.

<span class=3D"quote">&gt; 2. Valve sponsored an interesting project that r=
emoves dependency of AMD
&gt; Mesa from LLVM. And instead uses ACO. Valve made this available for Ar=
ch
&gt; based systems via AUR, and Ubuntu based system via PPA. If you want to=
 test
&gt; it, you can check the posts below. I am going to test this myself on b=
oth
&gt; Arch and Ubuntu.=20
&gt; <a href=3D"https://steamcommunity.com/games/221410/announcements/detai=
l/">https://steamcommunity.com/games/221410/announcements/detail/</a>
&gt; 1602634609636894200
&gt; <a href=3D"https://steamcommunity.com/app/221410/discussions/0/1640915=
206474070669/">https://steamcommunity.com/app/221410/discussions/0/16409152=
06474070669/</a></span >

Will check this out, but will also keep an eye on this thread about the res=
ults
of your tests. Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15624969495.1aC8f.16400--

--===============2103000578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2103000578==--
