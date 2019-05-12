Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1871AE4B
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 23:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8133A89336;
	Sun, 12 May 2019 21:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2042A89316
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 21:42:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1C842721CD; Sun, 12 May 2019 21:42:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Sun, 12 May 2019 21:42:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: bmilreu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102646-502-4rB1n1E45G@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1319968949=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1319968949==
Content-Type: multipart/alternative; boundary="15576973661.eA60.12795"
Content-Transfer-Encoding: 7bit


--15576973661.eA60.12795
Date: Sun, 12 May 2019 21:42:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

--- Comment #88 from bmilreu@gmail.com ---
(In reply to tempel.julian from comment #87)
> Applying the patch to 5.0, 5.1 and drm-next-5.2-wip fails with
>=20
> patching file drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> Hunk #5 FAILED at 3943.
> Hunk #6 succeeded at 3951 (offset -7 lines).
> Hunk #7 succeeded at 4035 (offset -7 lines).
> Hunk #8 succeeded at 4152 (offset -7 lines).
> Hunk #9 succeeded at 4669 (offset -7 lines).
> 1 out of 9 hunks FAILED -- saving rejects to file
> drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c.rej
> patching file drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.h

same here, can't figure which kernel is this based at

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15576973661.eA60.12795
Date: Sun, 12 May 2019 21:42:46 +0000
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
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c88">Comme=
nt # 88</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bmilreu&#64;gmail.com" title=3D"bmilreu&#64;gmail.com">bmilreu&#64;gmail.co=
m</a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
02646#c87">comment #87</a>)
<span class=3D"quote">&gt; Applying the patch to 5.0, 5.1 and drm-next-5.2-=
wip fails with
&gt;=20
&gt; patching file drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
&gt; Hunk #5 FAILED at 3943.
&gt; Hunk #6 succeeded at 3951 (offset -7 lines).
&gt; Hunk #7 succeeded at 4035 (offset -7 lines).
&gt; Hunk #8 succeeded at 4152 (offset -7 lines).
&gt; Hunk #9 succeeded at 4669 (offset -7 lines).
&gt; 1 out of 9 hunks FAILED -- saving rejects to file
&gt; drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c.rej
&gt; patching file drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.h</span >

same here, can't figure which kernel is this based at</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15576973661.eA60.12795--

--===============1319968949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1319968949==--
