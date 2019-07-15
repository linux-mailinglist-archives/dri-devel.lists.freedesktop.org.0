Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09369B1A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 21:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8C889AD2;
	Mon, 15 Jul 2019 19:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF1BA89A77
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 19:00:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E4EF572167; Mon, 15 Jul 2019 19:00:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 106447] System freeze after resuming from suspend (amdgpu)
Date: Mon, 15 Jul 2019 19:00:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: richard.kuenz@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-106447-502-bZddOZIztV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-106447-502@http.bugs.freedesktop.org/>
References: <bug-106447-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1099443860=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1099443860==
Content-Type: multipart/alternative; boundary="15632172270.EeCff.2857"
Content-Transfer-Encoding: 7bit


--15632172270.EeCff.2857
Date: Mon, 15 Jul 2019 19:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106447

--- Comment #18 from richard <richard.kuenz@web.de> ---
Hello ,

i don't know if this is the correct place to state this,
but i have a Desktop PC running=20

Ubuntu 16.04=20

and i noticed too that the system won't resume from suspend after installat=
ion
of=20

amdgpu-driver of rx560


this happens with the AMD Driver for 16.04 Xenial

https://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-amdgpupro


but also with the AMDGPU.PRO driver for 18.04

https://www.amd.com/pl/support/1881



I have to say that i use Kubuntu instead of Ubuntu.

 4.10.0-28-generic #32~16.04.2-Ubuntu SMP Thu Jul 20 10:19:48 UTC 2017 x86_=
64
x86_64 x86_64 GNU/Linux


The System is

Ryzen 5 2600
AMD RX560 2GB
16 GB RAM.



Withouth the AMDGPU Driver there is no problem with suspend as it seems.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15632172270.EeCff.2857
Date: Mon, 15 Jul 2019 19:00:27 +0000
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
   title=3D"NEW - System freeze after resuming from suspend (amdgpu)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106447#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System freeze after resuming from suspend (amdgpu)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106447">bug 10644=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
richard.kuenz&#64;web.de" title=3D"richard &lt;richard.kuenz&#64;web.de&gt;=
"> <span class=3D"fn">richard</span></a>
</span></b>
        <pre>Hello ,

i don't know if this is the correct place to state this,
but i have a Desktop PC running=20

Ubuntu 16.04=20

and i noticed too that the system won't resume from suspend after installat=
ion
of=20

amdgpu-driver of rx560


this happens with the AMD Driver for 16.04 Xenial

<a href=3D"https://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-am=
dgpupro">https://www.amd.com/en/support/kb/release-notes/rn-prorad-lin-amdg=
pupro</a>


but also with the AMDGPU.PRO driver for 18.04

<a href=3D"https://www.amd.com/pl/support/1881">https://www.amd.com/pl/supp=
ort/1881</a>



I have to say that i use Kubuntu instead of Ubuntu.

 4.10.0-28-generic #32~16.04.2-Ubuntu SMP Thu Jul 20 10:19:48 UTC 2017 x86_=
64
x86_64 x86_64 GNU/Linux


The System is

Ryzen 5 2600
AMD RX560 2GB
16 GB RAM.



Withouth the AMDGPU Driver there is no problem with suspend as it seems.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15632172270.EeCff.2857--

--===============1099443860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1099443860==--
