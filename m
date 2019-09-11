Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F263DAFB8A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8046EA96;
	Wed, 11 Sep 2019 11:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E42C6EA96
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 11:39:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2AF3172167; Wed, 11 Sep 2019 11:39:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111659] Kernel panic when waking up after screens go to dpms
 sleep
Date: Wed, 11 Sep 2019 11:39:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brad@fnarfbargle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111659-502-gQLmj8my0s@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111659-502@http.bugs.freedesktop.org/>
References: <bug-111659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1442274698=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1442274698==
Content-Type: multipart/alternative; boundary="15682019691.aE8bbC1d1.23837"
Content-Transfer-Encoding: 7bit


--15682019691.aE8bbC1d1.23837
Date: Wed, 11 Sep 2019 11:39:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111659

--- Comment #1 from Brad Campbell <brad@fnarfbargle.com> ---
Created attachment 145333
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145333&action=3Dedit
Complete dmesg

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682019691.aE8bbC1d1.23837
Date: Wed, 11 Sep 2019 11:39:29 +0000
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
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659">bug 11165=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brad&#64;fnarfbargle.com" title=3D"Brad Campbell &lt;brad&#64;fnarfbargle.c=
om&gt;"> <span class=3D"fn">Brad Campbell</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145333=
" name=3D"attach_145333" title=3D"Complete dmesg">attachment 145333</a> <a =
href=3D"attachment.cgi?id=3D145333&amp;action=3Dedit" title=3D"Complete dme=
sg">[details]</a></span>
Complete dmesg</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682019691.aE8bbC1d1.23837--

--===============1442274698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1442274698==--
