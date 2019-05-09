Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA218A1F
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 14:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F83A89683;
	Thu,  9 May 2019 12:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A7B489C17
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 12:56:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4781A7215A; Thu,  9 May 2019 12:56:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107607] Problems with MST display (REG_WAIT takes a while or
 times out)
Date: Thu, 09 May 2019 12:56:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugs.freedesktop.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107607-502-teoxTHHHIz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107607-502@http.bugs.freedesktop.org/>
References: <bug-107607-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0063018628=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0063018628==
Content-Type: multipart/alternative; boundary="15574065673.fC28b.11159"
Content-Transfer-Encoding: 7bit


--15574065673.fC28b.11159
Date: Thu, 9 May 2019 12:56:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107607

--- Comment #8 from Paul Menzel <pmenzel+bugs.freedesktop.org@molgen.mpg.de=
> ---
(In reply to Nicholas Kazlauskas from comment #7)
> Can you clarify the problem you're observing?
>=20
> Do all the displays go blank after switching inputs?

There is exactly one monitor/display.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574065673.fC28b.11159
Date: Thu, 9 May 2019 12:56:07 +0000
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
   title=3D"NEW - Problems with MST display (REG_WAIT takes a while or time=
s out)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107607#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Problems with MST display (REG_WAIT takes a while or time=
s out)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107607">bug 10760=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pmenzel+bugs.freedesktop.org&#64;molgen.mpg.de" title=3D"Paul Menzel &lt;pm=
enzel+bugs.freedesktop.org&#64;molgen.mpg.de&gt;"> <span class=3D"fn">Paul =
Menzel</span></a>
</span></b>
        <pre>(In reply to Nicholas Kazlauskas from <a href=3D"show_bug.cgi?=
id=3D107607#c7">comment #7</a>)
<span class=3D"quote">&gt; Can you clarify the problem you're observing?
&gt;=20
&gt; Do all the displays go blank after switching inputs?</span >

There is exactly one monitor/display.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574065673.fC28b.11159--

--===============0063018628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0063018628==--
