Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D010A923C5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 14:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FDD6E114;
	Mon, 19 Aug 2019 12:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C392F6E114
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 12:48:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C047B72161; Mon, 19 Aug 2019 12:48:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105651] Vega64 doesn't output properly onto dell up2715k at
 5120x2880
Date: Mon, 19 Aug 2019 12:48:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105651-502-gYXjmQqRGL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105651-502@http.bugs.freedesktop.org/>
References: <bug-105651-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1002115273=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1002115273==
Content-Type: multipart/alternative; boundary="15662189373.5e89a4DF.8377"
Content-Transfer-Encoding: 7bit


--15662189373.5e89a4DF.8377
Date: Mon, 19 Aug 2019 12:48:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105651

--- Comment #7 from Alex Deucher <alexdeucher@gmail.com> ---
You need to be using the amdgpu driver if you are running xorg.  I'm not su=
re
if the modesetting driver supports the tile property yet.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662189373.5e89a4DF.8377
Date: Mon, 19 Aug 2019 12:48:57 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Vega64 doesn't output properly onto dell up2715k at =
5120x2880"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105651#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Vega64 doesn't output properly onto dell up2715k at =
5120x2880"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105651">bug 10565=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>You need to be using the amdgpu driver if you are running xorg=
.  I'm not sure
if the modesetting driver supports the tile property yet.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662189373.5e89a4DF.8377--

--===============1002115273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1002115273==--
