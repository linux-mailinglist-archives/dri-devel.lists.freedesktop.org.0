Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA7CB57A0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 23:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1762D6ED80;
	Tue, 17 Sep 2019 21:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 353556ED87
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 21:32:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 31EB772167; Tue, 17 Sep 2019 21:32:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111244] amdgpu kernel 5.2 blank display after resume from suspend
Date: Tue, 17 Sep 2019 21:32:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miba_c@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111244-502-P9R15XizUP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111244-502@http.bugs.freedesktop.org/>
References: <bug-111244-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1861513179=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1861513179==
Content-Type: multipart/alternative; boundary="15687559762.Ce3FB.869"
Content-Transfer-Encoding: 7bit


--15687559762.Ce3FB.869
Date: Tue, 17 Sep 2019 21:32:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111244

--- Comment #28 from miba_c@gmx.at ---
Created attachment 145406
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145406&action=3Dedit
failed suspend 5.2.14

Still occasionally happens on 5.2.14. Hard to figure out what's causing this
since it seems rather random and only happens once in a while.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687559762.Ce3FB.869
Date: Tue, 17 Sep 2019 21:32:56 +0000
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
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244#c28">Comme=
nt # 28</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244">bug 11124=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
miba_c&#64;gmx.at" title=3D"miba_c&#64;gmx.at">miba_c&#64;gmx.at</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145406=
" name=3D"attach_145406" title=3D"failed suspend 5.2.14">attachment 145406<=
/a> <a href=3D"attachment.cgi?id=3D145406&amp;action=3Dedit" title=3D"faile=
d suspend 5.2.14">[details]</a></span>
failed suspend 5.2.14

Still occasionally happens on 5.2.14. Hard to figure out what's causing this
since it seems rather random and only happens once in a while.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687559762.Ce3FB.869--

--===============1861513179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1861513179==--
