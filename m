Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506571394D
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 12:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627B892A7;
	Sat,  4 May 2019 10:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D815D892A7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 10:42:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D4F3C7215A; Sat,  4 May 2019 10:42:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110605] "*ERROR* Waiting for fences timed out." happens every
 time when I select "Story" in the main game menu RE2.
Date: Sat, 04 May 2019 10:42:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110605-502-VWHty1rcVA@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110605-502@http.bugs.freedesktop.org/>
References: <bug-110605-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1842215123=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1842215123==
Content-Type: multipart/alternative; boundary="15569665630.7e62.9658"
Content-Transfer-Encoding: 7bit


--15569665630.7e62.9658
Date: Sat, 4 May 2019 10:42:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110605

--- Comment #5 from mikhail.v.gavrilov@gmail.com ---
Created attachment 144160
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144160&action=3Dedit
./umr -O many,bits -r *.*.mmCP_PFP_HEADER_DUMP

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569665630.7e62.9658
Date: Sat, 4 May 2019 10:42:43 +0000
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
   title=3D"NEW - &quot;*ERROR* Waiting for fences timed out.&quot; happens=
 every time when I select &quot;Story&quot; in the main game menu RE2."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110605#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;*ERROR* Waiting for fences timed out.&quot; happens=
 every time when I select &quot;Story&quot; in the main game menu RE2."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110605">bug 11060=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikhail.v.gavrilov&#64;gmail.com" title=3D"mikhail.v.gavrilov&#64;gmail.com=
">mikhail.v.gavrilov&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144160=
" name=3D"attach_144160" title=3D"./umr -O many,bits -r *.*.mmCP_PFP_HEADER=
_DUMP">attachment 144160</a> <a href=3D"attachment.cgi?id=3D144160&amp;acti=
on=3Dedit" title=3D"./umr -O many,bits -r *.*.mmCP_PFP_HEADER_DUMP">[detail=
s]</a></span>
./umr -O many,bits -r *.*.mmCP_PFP_HEADER_DUMP</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569665630.7e62.9658--

--===============1842215123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1842215123==--
