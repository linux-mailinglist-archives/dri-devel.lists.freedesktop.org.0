Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B82C781
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 15:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20116E22D;
	Tue, 28 May 2019 13:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEDB06E22D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 13:11:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AB5DB72167; Tue, 28 May 2019 13:11:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110783] Mesa 19.1 rc crashing MPV with VAAPI
Date: Tue, 28 May 2019 13:11:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: angrypenguinpoland@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110783-502-drBG8ZUbJn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110783-502@http.bugs.freedesktop.org/>
References: <bug-110783-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1462482541=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1462482541==
Content-Type: multipart/alternative; boundary="15590491150.F6ABaAde.18602"
Content-Transfer-Encoding: 7bit


--15590491150.F6ABaAde.18602
Date: Tue, 28 May 2019 13:11:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110783

--- Comment #1 from AngryPenguin <angrypenguinpoland@gmail.com> ---
Created attachment 144363
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144363&action=3Dedit
inxi

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590491150.F6ABaAde.18602
Date: Tue, 28 May 2019 13:11:55 +0000
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
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 19.1 rc crashing MPV with VAAPI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110783">bug 11078=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
angrypenguinpoland&#64;gmail.com" title=3D"AngryPenguin &lt;angrypenguinpol=
and&#64;gmail.com&gt;"> <span class=3D"fn">AngryPenguin</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144363=
" name=3D"attach_144363" title=3D"inxi">attachment 144363</a> <a href=3D"at=
tachment.cgi?id=3D144363&amp;action=3Dedit" title=3D"inxi">[details]</a></s=
pan>
inxi</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590491150.F6ABaAde.18602--

--===============1462482541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1462482541==--
