Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FD5CA034
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880F06E9F7;
	Thu,  3 Oct 2019 14:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 037D76E9F7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 14:20:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EEC1E72162; Thu,  3 Oct 2019 14:20:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111848] AMDGPU and display fails after resume from suspend
Date: Thu, 03 Oct 2019 14:20:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@cschwarz.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111848-502-BSTiSSuomV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111848-502@http.bugs.freedesktop.org/>
References: <bug-111848-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1148736935=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1148736935==
Content-Type: multipart/alternative; boundary="15701124032.66ce044.9083"
Content-Transfer-Encoding: 7bit


--15701124032.66ce044.9083
Date: Thu, 3 Oct 2019 14:20:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111848

--- Comment #13 from me@cschwarz.com ---
Can confirm this problem on

kernel-5.2.17-200.fc30=20
kernel-5.2.9-200.fc30
kernel-5.2.5-200.fc30
kernel-5.3.1-150.vanilla.knurd.1.fc30

Suspend & resume work flawlessly on

kernel-4.20.16-200.fc29

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15701124032.66ce044.9083
Date: Thu, 3 Oct 2019 14:20:03 +0000
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
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848">bug 11184=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;cschwarz.com" title=3D"me&#64;cschwarz.com">me&#64;cschwarz.com</a>
</span></b>
        <pre>Can confirm this problem on

kernel-5.2.17-200.fc30=20
kernel-5.2.9-200.fc30
kernel-5.2.5-200.fc30
kernel-5.3.1-150.vanilla.knurd.1.fc30

Suspend &amp; resume work flawlessly on

kernel-4.20.16-200.fc29</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15701124032.66ce044.9083--

--===============1148736935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1148736935==--
