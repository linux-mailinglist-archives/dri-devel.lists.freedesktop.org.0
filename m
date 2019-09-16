Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C1B43DD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 00:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7626EA95;
	Mon, 16 Sep 2019 22:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A62D56EA95
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:18:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9F82C72167; Mon, 16 Sep 2019 22:18:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111691] hardware cursor corruption w/ AMD 5700 XT
Date: Mon, 16 Sep 2019 22:18:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: a@bailtree.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111691-502-Pmn1itFJLT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111691-502@http.bugs.freedesktop.org/>
References: <bug-111691-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0894823030=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0894823030==
Content-Type: multipart/alternative; boundary="15686723070.a972D1be.17494"
Content-Transfer-Encoding: 7bit


--15686723070.a972D1be.17494
Date: Mon, 16 Sep 2019 22:18:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111691

--- Comment #9 from Michael Haworth <a@bailtree.co.uk> ---
I updated to the 5.3 release but has not fixed the issue

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686723070.a972D1be.17494
Date: Mon, 16 Sep 2019 22:18:27 +0000
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
   title=3D"NEW - hardware cursor corruption w/ AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - hardware cursor corruption w/ AMD 5700 XT"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111691">bug 11169=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
a&#64;bailtree.co.uk" title=3D"Michael Haworth &lt;a&#64;bailtree.co.uk&gt;=
"> <span class=3D"fn">Michael Haworth</span></a>
</span></b>
        <pre>I updated to the 5.3 release but has not fixed the issue</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686723070.a972D1be.17494--

--===============0894823030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0894823030==--
