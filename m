Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F085B14090
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 17:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65DA89320;
	Sun,  5 May 2019 15:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5910489320
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 15:20:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4FCA37215A; Sun,  5 May 2019 15:20:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110614] [Regression] Freeze at desktop manager startup
Date: Sun, 05 May 2019 15:20:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: raffarti@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110614-502-22UzOuGclK@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110614-502@http.bugs.freedesktop.org/>
References: <bug-110614-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1854275778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1854275778==
Content-Type: multipart/alternative; boundary="15570696100.8Edc60D0.25482"
Content-Transfer-Encoding: 7bit


--15570696100.8Edc60D0.25482
Date: Sun, 5 May 2019 15:20:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110614

--- Comment #1 from raffarti@zoho.com ---
Created attachment 144166
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144166&action=3Dedit
backtrace from journal

Debugoptimized build, trace from journalctl.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15570696100.8Edc60D0.25482
Date: Sun, 5 May 2019 15:20:10 +0000
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
   title=3D"NEW - [Regression] Freeze at desktop manager startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110614#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression] Freeze at desktop manager startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110614">bug 11061=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
raffarti&#64;zoho.com" title=3D"raffarti&#64;zoho.com">raffarti&#64;zoho.co=
m</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144166=
" name=3D"attach_144166" title=3D"backtrace from journal">attachment 144166=
</a> <a href=3D"attachment.cgi?id=3D144166&amp;action=3Dedit" title=3D"back=
trace from journal">[details]</a></span>
backtrace from journal

Debugoptimized build, trace from journalctl.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15570696100.8Edc60D0.25482--

--===============1854275778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1854275778==--
