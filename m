Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E907145C2
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E718912D;
	Mon,  6 May 2019 08:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C6FE895B4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:09:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 08F8C7215A; Mon,  6 May 2019 08:09:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Mon, 06 May 2019 08:09:56 +0000
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
Message-ID: <bug-109345-502-NxllKd6J4t@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2036502066=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2036502066==
Content-Type: multipart/alternative; boundary="15571301960.Adf401.14838"
Content-Transfer-Encoding: 7bit


--15571301960.Adf401.14838
Date: Mon, 6 May 2019 08:09:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #32 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
Hi All,

Allan successfully tested the sixth test kernel today. He wrote:

Christian
DRM6 boots to Firepro.

cheers

ace

------

This step has been marked as good because the sixth test kernel boots to
FirePro.

Next step:

git bisect good

Output:

Bisecting: 11 revisions left to test after this (roughly 4 steps)
[068f304781804e208f901d8f6083189e0e28c420] drm/drm_pci.c: Use
dma_zalloc_coherent

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: http://www.xenosoft.de/uImage-drm7

@Allan (acefnq/ace)
Please test it.

Thanks,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571301960.Adf401.14838
Date: Mon, 6 May 2019 08:09:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c32">Comme=
nt # 32</a>
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

Allan successfully tested the sixth test kernel today. He wrote:

Christian
DRM6 boots to Firepro.

cheers

ace

------

This step has been marked as good because the sixth test kernel boots to
FirePro.

Next step:

git bisect good

Output:

Bisecting: 11 revisions left to test after this (roughly 4 steps)
[068f304781804e208f901d8f6083189e0e28c420] drm/drm_pci.c: Use
dma_zalloc_coherent

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc oldconfig

make CROSS_COMPILE=3Dpowerpc-linux-gnu- ARCH=3Dpowerpc uImage

Download: <a href=3D"http://www.xenosoft.de/uImage-drm7">http://www.xenosof=
t.de/uImage-drm7</a>

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

--15571301960.Adf401.14838--

--===============2036502066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2036502066==--
