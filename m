Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AEB60CE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 11:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D08F6EE95;
	Wed, 18 Sep 2019 09:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A26F56EE97
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 09:52:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9E7A972167; Wed, 18 Sep 2019 09:52:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Wed, 18 Sep 2019 09:52:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: aide.brown@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-zg0aBDVo2i@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0617394978=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0617394978==
Content-Type: multipart/alternative; boundary="15688003713.8Cc01.4971"
Content-Transfer-Encoding: 7bit


--15688003713.8Cc01.4971
Date: Wed, 18 Sep 2019 09:52:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #125 from Adrian Brown <aide.brown@googlemail.com> ---
I am also getting frequent crashes with a Radeon VII on Kubuntu 19.10 (kern=
el
5.0.0-29-generic). I see there is some discussion in this thread about it
possibly being related to multiple monitors. But I don't think that's the c=
ase.
I have a single monitor but it is old with only a dual link DVI connection.=
 So
I am using displayport on the GPU but connected to an active adapter to con=
vert
DP to a dual link DVI connection (my monitor is a Dell 3007WFP running at
2560x1600).

I often get crashes soon after boot. They tend to happen in clusters so it
crashes a few times, then stays stable for a short time and then crashes ag=
ain.
I don't get these crashes on the same system when dual booted into Windows =
10
so the hardware itself seems good.=20

One thing worth mentioning is that on Windows 10 I occasionally get a black
screen and the monitor goes off for a couple of seconds. It then comes back=
 to
life. Apparently this is not uncommon and the suspicion in the Windows
community is that AMD drivers sometimes crash but Windows recovers (I never=
 had
this with my Vega 64, only with the Radeon VII). It most likely is a comple=
tely
different issue of course, but thought it worth mentioning.

Still hoping for a fix at some point. Also happy to help test any fix.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15688003713.8Cc01.4971
Date: Wed, 18 Sep 2019 09:52:51 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c125">Comm=
ent # 125</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
aide.brown&#64;googlemail.com" title=3D"Adrian Brown &lt;aide.brown&#64;goo=
glemail.com&gt;"> <span class=3D"fn">Adrian Brown</span></a>
</span></b>
        <pre>I am also getting frequent crashes with a Radeon VII on Kubunt=
u 19.10 (kernel
5.0.0-29-generic). I see there is some discussion in this thread about it
possibly being related to multiple monitors. But I don't think that's the c=
ase.
I have a single monitor but it is old with only a dual link DVI connection.=
 So
I am using displayport on the GPU but connected to an active adapter to con=
vert
DP to a dual link DVI connection (my monitor is a Dell 3007WFP running at
2560x1600).

I often get crashes soon after boot. They tend to happen in clusters so it
crashes a few times, then stays stable for a short time and then crashes ag=
ain.
I don't get these crashes on the same system when dual booted into Windows =
10
so the hardware itself seems good.=20

One thing worth mentioning is that on Windows 10 I occasionally get a black
screen and the monitor goes off for a couple of seconds. It then comes back=
 to
life. Apparently this is not uncommon and the suspicion in the Windows
community is that AMD drivers sometimes crash but Windows recovers (I never=
 had
this with my Vega 64, only with the Radeon VII). It most likely is a comple=
tely
different issue of course, but thought it worth mentioning.

Still hoping for a fix at some point. Also happy to help test any fix.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15688003713.8Cc01.4971--

--===============0617394978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0617394978==--
