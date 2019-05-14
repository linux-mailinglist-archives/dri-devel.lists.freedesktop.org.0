Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9991CD25
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 18:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B21892C2;
	Tue, 14 May 2019 16:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F16C9892C2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:38:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EDF4D721CD; Tue, 14 May 2019 16:38:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110677] Can't invert screen colors by adjusting the gamma ramp
Date: Tue, 14 May 2019 16:38:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vladzzag@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110677-502-yXEfKYrXys@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110677-502@http.bugs.freedesktop.org/>
References: <bug-110677-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1472192857=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1472192857==
Content-Type: multipart/alternative; boundary="15578519041.cB7A772.3883"
Content-Transfer-Encoding: 7bit


--15578519041.cB7A772.3883
Date: Tue, 14 May 2019 16:38:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110677

--- Comment #1 from Vlad Zagorodniy <vladzzag@gmail.com> ---
Created attachment 144265
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144265&action=3Dedit
observed

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15578519041.cB7A772.3883
Date: Tue, 14 May 2019 16:38:24 +0000
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
   title=3D"NEW - Can't invert screen colors by adjusting the gamma ramp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110677#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Can't invert screen colors by adjusting the gamma ramp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110677">bug 11067=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vladzzag&#64;gmail.com" title=3D"Vlad Zagorodniy &lt;vladzzag&#64;gmail.com=
&gt;"> <span class=3D"fn">Vlad Zagorodniy</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144265=
" name=3D"attach_144265" title=3D"observed">attachment 144265</a> <a href=
=3D"attachment.cgi?id=3D144265&amp;action=3Dedit" title=3D"observed">[detai=
ls]</a></span>
observed</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15578519041.cB7A772.3883--

--===============1472192857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1472192857==--
