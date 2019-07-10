Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0564383
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 10:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D316E0C6;
	Wed, 10 Jul 2019 08:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2B446E0C9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:26:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AF67D72167; Wed, 10 Jul 2019 08:26:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 10 Jul 2019 08:26:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-9bDwnDwNu8@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1782206931=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1782206931==
Content-Type: multipart/alternative; boundary="15627471832.A11cC.12337"
Content-Transfer-Encoding: 7bit


--15627471832.A11cC.12337
Date: Wed, 10 Jul 2019 08:26:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #46 from Mauro Gaspari <ilvipero@gmx.com> ---
This is exactly the reason why I wish we could get more attention to this
issue.=20
I have seen so many people in forums on the internet replacing their AMD ca=
rds
with NVIDIA due to similar issues. Or switching back to windows.=20

I do not have the proof that the issue is just Mesa, could be a combination=
 of
mesa, kernel, firmware for all I know.=20

I  opened this bug to see if I could get help troubleshooting the issue and
finding a permanent fix for all affected users. If there is a better place =
to
report this, I am happy to open as many tickets and sending as many emails =
as
needed :)

Also It would be extremely helpful if we had a script or something to trigg=
er
the freeze quickly and consistently, so that troubleshooting mesa, kernel, =
ad
firmware combinations would be so much easier and reliable.=20
If anyone has a test suite or script or some automated check that can trigg=
er
the issue quickly, please share.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627471832.A11cC.12337
Date: Wed, 10 Jul 2019 08:26:23 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c46">Comme=
nt # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>This is exactly the reason why I wish we could get more attent=
ion to this
issue.=20
I have seen so many people in forums on the internet replacing their AMD ca=
rds
with NVIDIA due to similar issues. Or switching back to windows.=20

I do not have the proof that the issue is just Mesa, could be a combination=
 of
mesa, kernel, firmware for all I know.=20

I  opened this bug to see if I could get help troubleshooting the issue and
finding a permanent fix for all affected users. If there is a better place =
to
report this, I am happy to open as many tickets and sending as many emails =
as
needed :)

Also It would be extremely helpful if we had a script or something to trigg=
er
the freeze quickly and consistently, so that troubleshooting mesa, kernel, =
ad
firmware combinations would be so much easier and reliable.=20
If anyone has a test suite or script or some automated check that can trigg=
er
the issue quickly, please share.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627471832.A11cC.12337--

--===============1782206931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1782206931==--
