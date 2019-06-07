Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BE38305
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 05:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2A189A91;
	Fri,  7 Jun 2019 03:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7014F89A91
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 03:08:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6C92D72167; Fri,  7 Jun 2019 03:08:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109022] ring gfx timeout during particular shader generation on
 yuzu emulator
Date: Fri, 07 Jun 2019 03:08:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: felix.adrianto@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-109022-502-FAT53un6Nf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109022-502@http.bugs.freedesktop.org/>
References: <bug-109022-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1900113004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1900113004==
Content-Type: multipart/alternative; boundary="15598769311.BcA55C3D.31539"
Content-Transfer-Encoding: 7bit


--15598769311.BcA55C3D.31539
Date: Fri, 7 Jun 2019 03:08:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109022

--- Comment #22 from e88z4 <felix.adrianto@gmail.com> ---
Created attachment 144472
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144472&action=3Dedit
apitrace log

Hi,=20

I attached the apitrace log being written to my standard output while repla=
ying
my apitrace file in my google drive.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15598769311.BcA55C3D.31539
Date: Fri, 7 Jun 2019 03:08:51 +0000
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
   title=3D"NEW - ring gfx timeout during particular shader generation on y=
uzu emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring gfx timeout during particular shader generation on y=
uzu emulator"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109022">bug 10902=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
felix.adrianto&#64;gmail.com" title=3D"e88z4 &lt;felix.adrianto&#64;gmail.c=
om&gt;"> <span class=3D"fn">e88z4</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144472=
" name=3D"attach_144472" title=3D"apitrace log">attachment 144472</a> <a hr=
ef=3D"attachment.cgi?id=3D144472&amp;action=3Dedit" title=3D"apitrace log">=
[details]</a></span>
apitrace log

Hi,=20

I attached the apitrace log being written to my standard output while repla=
ying
my apitrace file in my google drive.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15598769311.BcA55C3D.31539--

--===============1900113004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1900113004==--
