Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D665A82BD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BC5899B0;
	Wed,  4 Sep 2019 12:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6D6F899B0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:50:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D34F472161; Wed,  4 Sep 2019 12:50:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111551] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1
 timeout
Date: Wed, 04 Sep 2019 12:50:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: 78666679@qq.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111551-502-oaOnLwZ8Nt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111551-502@http.bugs.freedesktop.org/>
References: <bug-111551-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1387536037=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1387536037==
Content-Type: multipart/alternative; boundary="15676014141.44b8f.11419"
Content-Transfer-Encoding: 7bit


--15676014141.44b8f.11419
Date: Wed, 4 Sep 2019 12:50:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111551

--- Comment #6 from yanhua <78666679@qq.com> ---
As far as I know, arm64 does not support wc memory. and We have already turn
the wc flag as newer kernel version does.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676014141.44b8f.11419
Date: Wed, 4 Sep 2019 12:50:14 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing sdma1 timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED INVALID - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing sdma1 timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551">bug 11155=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
78666679&#64;qq.com" title=3D"yanhua &lt;78666679&#64;qq.com&gt;"> <span cl=
ass=3D"fn">yanhua</span></a>
</span></b>
        <pre>As far as I know, arm64 does not support wc memory. and We hav=
e already turn
the wc flag as newer kernel version does.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676014141.44b8f.11419--

--===============1387536037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1387536037==--
