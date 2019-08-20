Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31E961C2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82046E7FA;
	Tue, 20 Aug 2019 13:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B2E16E7FA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:58:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3802172161; Tue, 20 Aug 2019 13:58:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111432] [bisected][tonga] Boot failures on agd5f's drm-next
 branch
Date: Tue, 20 Aug 2019 13:58:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mike@fireburn.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111432-502-G2Me3wQmX1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111432-502@http.bugs.freedesktop.org/>
References: <bug-111432-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0060642871=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0060642871==
Content-Type: multipart/alternative; boundary="15663095391.34A44E081.26077"
Content-Transfer-Encoding: 7bit


--15663095391.34A44E081.26077
Date: Tue, 20 Aug 2019 13:58:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111432

--- Comment #4 from Mike Lothian <mike@fireburn.co.uk> ---
This is a PRIME laptop with both i915 & amdgpu graphics

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663095391.34A44E081.26077
Date: Tue, 20 Aug 2019 13:58:59 +0000
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
   title=3D"NEW - [bisected][tonga] Boot failures on agd5f's drm-next branc=
h"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111432#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [bisected][tonga] Boot failures on agd5f's drm-next branc=
h"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111432">bug 11143=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mike&#64;fireburn.co.uk" title=3D"Mike Lothian &lt;mike&#64;fireburn.co.uk&=
gt;"> <span class=3D"fn">Mike Lothian</span></a>
</span></b>
        <pre>This is a PRIME laptop with both i915 &amp; amdgpu graphics</p=
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

--15663095391.34A44E081.26077--

--===============0060642871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0060642871==--
