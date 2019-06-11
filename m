Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6333C8B5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 12:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5364D89010;
	Tue, 11 Jun 2019 10:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D8D6688FE2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:20:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CEF8C72167; Tue, 11 Jun 2019 10:20:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110888] 5.0.21 kernel crash when many GPU app run concurrently 
 , error msg: amdgpu_vm_validate_pt_bos() failed. ,
 Not enough memory for command submission!
Date: Tue, 11 Jun 2019 10:20:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: wormwang@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110888-502-mZjffvwOra@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110888-502@http.bugs.freedesktop.org/>
References: <bug-110888-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0730750783=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0730750783==
Content-Type: multipart/alternative; boundary="15602484350.ecacFf.6061"
Content-Transfer-Encoding: 7bit


--15602484350.ecacFf.6061
Date: Tue, 11 Jun 2019 10:20:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110888

--- Comment #1 from wormwang <wormwang@yahoo.com> ---
Created attachment 144503
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144503&action=3Dedit
radeontop just before kernel crash

radeontop just before the kernel crash.

VRAM just is about 65% free.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602484350.ecacFf.6061
Date: Tue, 11 Jun 2019 10:20:35 +0000
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
   title=3D"NEW - 5.0.21 kernel crash when many GPU app run concurrently , =
error msg: amdgpu_vm_validate_pt_bos() failed. , Not enough memory for comm=
and submission!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110888#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 5.0.21 kernel crash when many GPU app run concurrently , =
error msg: amdgpu_vm_validate_pt_bos() failed. , Not enough memory for comm=
and submission!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110888">bug 11088=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wormwang&#64;yahoo.com" title=3D"wormwang &lt;wormwang&#64;yahoo.com&gt;"> =
<span class=3D"fn">wormwang</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144503=
" name=3D"attach_144503" title=3D"radeontop just before kernel crash">attac=
hment 144503</a> <a href=3D"attachment.cgi?id=3D144503&amp;action=3Dedit" t=
itle=3D"radeontop just before kernel crash">[details]</a></span>
radeontop just before kernel crash

radeontop just before the kernel crash.

VRAM just is about 65% free.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602484350.ecacFf.6061--

--===============0730750783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0730750783==--
