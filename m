Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F9FEBD0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2019 12:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5576E0A5;
	Sat, 16 Nov 2019 11:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A3DD6E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2019 11:28:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 96441720E2; Sat, 16 Nov 2019 11:28:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112302] [kernel 5.4-rc7][amdgpu] kmemleak reports various leaks
Date: Sat, 16 Nov 2019 11:28:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-112302-502-1QBCjgZzcN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112302-502@http.bugs.freedesktop.org/>
References: <bug-112302-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1399436165=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1399436165==
Content-Type: multipart/alternative; boundary="15739036880.1f2336B4.26081"
Content-Transfer-Encoding: 7bit


--15739036880.1f2336B4.26081
Date: Sat, 16 Nov 2019 11:28:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112302

--- Comment #2 from erhard_f@mailbox.org ---
Created attachment 145974
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145974&action=3Dedit
kernel .config (kernel 5.4-rc7)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739036880.1f2336B4.26081
Date: Sat, 16 Nov 2019 11:28:08 +0000
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
   title=3D"NEW - [kernel 5.4-rc7][amdgpu] kmemleak reports various leaks"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112302#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.4-rc7][amdgpu] kmemleak reports various leaks"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112302">bug 11230=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145974=
" name=3D"attach_145974" title=3D"kernel .config (kernel 5.4-rc7)">attachme=
nt 145974</a> <a href=3D"attachment.cgi?id=3D145974&amp;action=3Dedit" titl=
e=3D"kernel .config (kernel 5.4-rc7)">[details]</a></span>
kernel .config (kernel 5.4-rc7)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739036880.1f2336B4.26081--

--===============1399436165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1399436165==--
