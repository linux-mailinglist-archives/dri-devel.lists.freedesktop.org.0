Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AAA3D508
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F04891DA;
	Tue, 11 Jun 2019 18:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 580D5891DA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:07:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 54AD672167; Tue, 11 Jun 2019 18:07:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110862] Dual-monitors invalid state after turning on
Date: Tue, 11 Jun 2019 18:07:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: denisgolovan@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110862-502-sXISjWsb4a@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110862-502@http.bugs.freedesktop.org/>
References: <bug-110862-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2040083396=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2040083396==
Content-Type: multipart/alternative; boundary="15602764411.6DFA.12512"
Content-Transfer-Encoding: 7bit


--15602764411.6DFA.12512
Date: Tue, 11 Jun 2019 18:07:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110862

--- Comment #7 from denisgolovan@yandex.ru ---
Created attachment 144511
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144511&action=3Dedit
dmesg after successfull X restart

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602764411.6DFA.12512
Date: Tue, 11 Jun 2019 18:07:21 +0000
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
   title=3D"NEW - Dual-monitors invalid state after turning on"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110862#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Dual-monitors invalid state after turning on"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110862">bug 11086=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
denisgolovan&#64;yandex.ru" title=3D"denisgolovan&#64;yandex.ru">denisgolov=
an&#64;yandex.ru</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144511=
" name=3D"attach_144511" title=3D"dmesg after successfull X restart">attach=
ment 144511</a> <a href=3D"attachment.cgi?id=3D144511&amp;action=3Dedit" ti=
tle=3D"dmesg after successfull X restart">[details]</a></span>
dmesg after successfull X restart</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602764411.6DFA.12512--

--===============2040083396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2040083396==--
