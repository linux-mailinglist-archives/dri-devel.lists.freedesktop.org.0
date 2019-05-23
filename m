Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8362F28652
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 21:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11A16E064;
	Thu, 23 May 2019 19:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 007E06E061
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 19:09:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ECC9872167; Thu, 23 May 2019 19:09:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110217] RX580: screen turns black or flickers until forced
 reconfiguration
Date: Thu, 23 May 2019 19:09:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: numzer0@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110217-502-CmhNtQxMxU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110217-502@http.bugs.freedesktop.org/>
References: <bug-110217-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1432521771=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1432521771==
Content-Type: multipart/alternative; boundary="15586385810.23BCbcaa.17651"
Content-Transfer-Encoding: 7bit


--15586385810.23BCbcaa.17651
Date: Thu, 23 May 2019 19:09:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110217

--- Comment #5 from numzer0@yandex.ru ---
The flicker seems to be due to
https://bugs.freedesktop.org/show_bug.cgi?id=3D102646, despite the fact Arc=
h wiki
tells that affects 120+=C2=A0Hz only (my monitor runs at=C2=A075 Hz). At le=
ast fixing
clocks fixes the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586385810.23BCbcaa.17651
Date: Thu, 23 May 2019 19:09:41 +0000
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
   title=3D"NEW - RX580: screen turns black or flickers until forced reconf=
iguration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110217#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX580: screen turns black or flickers until forced reconf=
iguration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110217">bug 11021=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
numzer0&#64;yandex.ru" title=3D"numzer0&#64;yandex.ru">numzer0&#64;yandex.r=
u</a>
</span></b>
        <pre>The flicker seems to be due to
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"show_bug.cgi?id=3D102646">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D102646</a>, despite the fact Arch wiki
tells that affects 120+=C2=A0Hz only (my monitor runs at=C2=A075 Hz). At le=
ast fixing
clocks fixes the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586385810.23BCbcaa.17651--

--===============1432521771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1432521771==--
