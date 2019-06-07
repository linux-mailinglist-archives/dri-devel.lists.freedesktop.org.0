Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEFE3928F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 18:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A7589AA7;
	Fri,  7 Jun 2019 16:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C67C89AA7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 16:54:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5DBA7721A2; Fri,  7 Jun 2019 16:54:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108309] Raven Ridge 2700U system lock-up on multiple games
Date: Fri, 07 Jun 2019 16:54:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason.oliveira@medicalcannab.is
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108309-502-Ga487rd3hZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108309-502@http.bugs.freedesktop.org/>
References: <bug-108309-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1496247773=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1496247773==
Content-Type: multipart/alternative; boundary="15599264752.6BdbDd.13476"
Content-Transfer-Encoding: 7bit


--15599264752.6BdbDd.13476
Date: Fri, 7 Jun 2019 16:54:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108309

--- Comment #10 from Jason Oliveira <jason.oliveira@medicalcannab.is> ---
Having the same issue, but it seems to be localized to Vulkan. I've confirm=
ed
this on a Ryzen 2300U laptop and a desktop Ryzen 2400G. I have a save file =
in
Pac-Man Champion Edition DX+ that guaranteed will crash the system within 5
seconds of loading a time trial screen on both laptops. Same save file works
fine on a proprietary nvidia card, and on (cherry trail) intel drivers, so =
this
looks like it's a Vulkan bug exhibiting itself through DXVK on Raven Ridge.=
=20

Tested on 19.1.0_rc2 and git current as of this date: both exhibit identical
issues in Ubuntu and Gentoo.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599264752.6BdbDd.13476
Date: Fri, 7 Jun 2019 16:54:35 +0000
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
   title=3D"NEW - Raven Ridge 2700U system lock-up on multiple games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108309#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Raven Ridge 2700U system lock-up on multiple games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108309">bug 10830=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jason.oliveira&#64;medicalcannab.is" title=3D"Jason Oliveira &lt;jason.oliv=
eira&#64;medicalcannab.is&gt;"> <span class=3D"fn">Jason Oliveira</span></a>
</span></b>
        <pre>Having the same issue, but it seems to be localized to Vulkan.=
 I've confirmed
this on a Ryzen 2300U laptop and a desktop Ryzen 2400G. I have a save file =
in
Pac-Man Champion Edition DX+ that guaranteed will crash the system within 5
seconds of loading a time trial screen on both laptops. Same save file works
fine on a proprietary nvidia card, and on (cherry trail) intel drivers, so =
this
looks like it's a Vulkan bug exhibiting itself through DXVK on Raven Ridge.=
=20

Tested on 19.1.0_rc2 and git current as of this date: both exhibit identical
issues in Ubuntu and Gentoo.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599264752.6BdbDd.13476--

--===============1496247773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1496247773==--
