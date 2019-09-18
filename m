Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72010B5E38
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 09:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CBF6EE24;
	Wed, 18 Sep 2019 07:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC1FF6EE24
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 07:42:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E8BD472167; Wed, 18 Sep 2019 07:42:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111729] RX480 : random NULL pointer dereference on resume from
 suspend
Date: Wed, 18 Sep 2019 07:42:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: nmset@netcourrier.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111729-502-wM9ZFjREAS@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111729-502@http.bugs.freedesktop.org/>
References: <bug-111729-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1976045018=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1976045018==
Content-Type: multipart/alternative; boundary="15687925571.991D4.14482"
Content-Transfer-Encoding: 7bit


--15687925571.991D4.14482
Date: Wed, 18 Sep 2019 07:42:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111729

--- Comment #1 from SET <nmset@netcourrier.com> ---
Created attachment 145422
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145422&action=3Dedit
Xorg log

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687925571.991D4.14482
Date: Wed, 18 Sep 2019 07:42:37 +0000
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
   title=3D"NEW - RX480 : random NULL pointer dereference on resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111729#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX480 : random NULL pointer dereference on resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111729">bug 11172=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nmset&#64;netcourrier.com" title=3D"SET &lt;nmset&#64;netcourrier.com&gt;">=
 <span class=3D"fn">SET</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145422=
" name=3D"attach_145422" title=3D"Xorg log">attachment 145422</a> <a href=
=3D"attachment.cgi?id=3D145422&amp;action=3Dedit" title=3D"Xorg log">[detai=
ls]</a></span>
Xorg log</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687925571.991D4.14482--

--===============1976045018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1976045018==--
