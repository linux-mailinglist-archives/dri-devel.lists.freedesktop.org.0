Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E914C778E9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 15:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919F36EEB4;
	Sat, 27 Jul 2019 13:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F02196EEB4
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 13:20:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ECF2972167; Sat, 27 Jul 2019 13:20:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111231] random VM_L2_PROTECTION_FAULTs when loading a world in
 minetest on AMD ryzen 2200G integrated graphics
Date: Sat, 27 Jul 2019 13:20:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111231-502-XiiYsXXVBt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111231-502@http.bugs.freedesktop.org/>
References: <bug-111231-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0224811441=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0224811441==
Content-Type: multipart/alternative; boundary="15642336270.4De68B.343"
Content-Transfer-Encoding: 7bit


--15642336270.4De68B.343
Date: Sat, 27 Jul 2019 13:20:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111231

--- Comment #3 from deltasquared <ds2.bugs.freedesktop@gmail.com> ---
Created attachment 144884
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144884&action=3Dedit
apitrace replay --verbose --debug: stderr

stderr of the same as above.
I made them separate as it helped me to have a look through them - though
notably the stack trace I see at the end of this stderr output can't be pla=
ced
in relation to stdout now, so if need be I can re-run the offending replay =
file
with both redirected to the same file.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15642336270.4De68B.343
Date: Sat, 27 Jul 2019 13:20:27 +0000
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
   title=3D"NEW - random VM_L2_PROTECTION_FAULTs when loading a world in mi=
netest on AMD ryzen 2200G integrated graphics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - random VM_L2_PROTECTION_FAULTs when loading a world in mi=
netest on AMD ryzen 2200G integrated graphics"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111231">bug 11123=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ds2.bugs.freedesktop&#64;gmail.com" title=3D"deltasquared &lt;ds2.bugs.free=
desktop&#64;gmail.com&gt;"> <span class=3D"fn">deltasquared</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144884=
" name=3D"attach_144884" title=3D"apitrace replay --verbose --debug: stderr=
">attachment 144884</a> <a href=3D"attachment.cgi?id=3D144884&amp;action=3D=
edit" title=3D"apitrace replay --verbose --debug: stderr">[details]</a></sp=
an>
apitrace replay --verbose --debug: stderr

stderr of the same as above.
I made them separate as it helped me to have a look through them - though
notably the stack trace I see at the end of this stderr output can't be pla=
ced
in relation to stdout now, so if need be I can re-run the offending replay =
file
with both redirected to the same file.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15642336270.4De68B.343--

--===============0224811441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0224811441==--
