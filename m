Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1914022
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 16:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C452789217;
	Sun,  5 May 2019 14:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9492C892BE
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 14:17:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 90F0B7215A; Sun,  5 May 2019 14:17:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Sun, 05 May 2019 14:17:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-UCLiPMWLb3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2071816534=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2071816534==
Content-Type: multipart/alternative; boundary="15570658232.F8fE5795.17441"
Content-Transfer-Encoding: 7bit


--15570658232.F8fE5795.17441
Date: Sun, 5 May 2019 14:17:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #31 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
Hi All,

Allan has tested the fifth test kernel. He wrote:

Christian
DRM5 boots to Firepro!

ace

------

This step has been marked as good.

Next step:

git bisect good

Output:

Bisecting: 22 revisions left to test after this (roughly 5 steps)
[48197bc564c7a1888c86024a1ba4f956e0ec2300] drm: add syncobj timeline suppor=
t v9

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: http://www.xenosoft.de/uImage-drm6

@Allan (acefnq/ace)
Please test it.

Thanks,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15570658232.F8fE5795.17441
Date: Sun, 5 May 2019 14:17:03 +0000
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
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c31">Comme=
nt # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>Hi All,

Allan has tested the fifth test kernel. He wrote:

Christian
DRM5 boots to Firepro!

ace

------

This step has been marked as good.

Next step:

git bisect good

Output:

Bisecting: 22 revisions left to test after this (roughly 5 steps)
[48197bc564c7a1888c86024a1ba4f956e0ec2300] drm: add syncobj timeline suppor=
t v9

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: <a href=3D"http://www.xenosoft.de/uImage-drm6">http://www.xenosof=
t.de/uImage-drm6</a>

&#64;Allan (acefnq/ace)
Please test it.

Thanks,
Christian</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15570658232.F8fE5795.17441--

--===============2071816534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2071816534==--
