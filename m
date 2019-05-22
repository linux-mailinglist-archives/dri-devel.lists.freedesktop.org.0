Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD28271FE
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 23:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FECA89C84;
	Wed, 22 May 2019 21:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE46589C89
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 21:59:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DAD8372167; Wed, 22 May 2019 21:59:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108824] Invalid handling when GL buffer is bound on one context
 and invalidated on another
Date: Wed, 22 May 2019 21:59:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: raffarti@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108824-502-mRfWuj8rRn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108824-502@http.bugs.freedesktop.org/>
References: <bug-108824-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0772272405=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0772272405==
Content-Type: multipart/alternative; boundary="15585623684.B5DA4de.14849"
Content-Transfer-Encoding: 7bit


--15585623684.B5DA4de.14849
Date: Wed, 22 May 2019 21:59:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108824

--- Comment #14 from raffarti@zoho.com ---
The patch fixes corruption caused by 78e35df52aa2f7d770f929a0866a0faa89c261=
a9
but not the one from 12bf7cfecf52083c484602f971738475edfe497e, which still
persists in scroll bars of falkon and akregator.
I'm using an RX 480.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585623684.B5DA4de.14849
Date: Wed, 22 May 2019 21:59:28 +0000
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
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824">bug 10882=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
raffarti&#64;zoho.com" title=3D"raffarti&#64;zoho.com">raffarti&#64;zoho.co=
m</a>
</span></b>
        <pre>The patch fixes corruption caused by 78e35df52aa2f7d770f929a08=
66a0faa89c261a9
but not the one from 12bf7cfecf52083c484602f971738475edfe497e, which still
persists in scroll bars of falkon and akregator.
I'm using an RX 480.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585623684.B5DA4de.14849--

--===============0772272405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0772272405==--
