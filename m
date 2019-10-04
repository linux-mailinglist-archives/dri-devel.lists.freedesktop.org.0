Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B56CC2A3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 20:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A29F6EC0E;
	Fri,  4 Oct 2019 18:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64EEF6EC0C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 18:27:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 61C1672162; Fri,  4 Oct 2019 18:27:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111848] AMDGPU and display fails after resume from suspend
Date: Fri, 04 Oct 2019 18:27:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@cschwarz.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111848-502-FWpIyoMol6@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111848-502@http.bugs.freedesktop.org/>
References: <bug-111848-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0719803531=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0719803531==
Content-Type: multipart/alternative; boundary="15702136570.FaDB.18735"
Content-Transfer-Encoding: 7bit


--15702136570.FaDB.18735
Date: Fri, 4 Oct 2019 18:27:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111848

--- Comment #18 from me@cschwarz.com ---
Bisection turns out to be harder than anticipated because there is another =
bug
that makes the system freeze on suspend (not reported yet).

Anyways, this seems to be a duplicate of
https://bugs.freedesktop.org/show_bug.cgi?id=3D111729#c7

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702136570.FaDB.18735
Date: Fri, 4 Oct 2019 18:27:37 +0000
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
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848">bug 11184=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
me&#64;cschwarz.com" title=3D"me&#64;cschwarz.com">me&#64;cschwarz.com</a>
</span></b>
        <pre>Bisection turns out to be harder than anticipated because ther=
e is another bug
that makes the system freeze on suspend (not reported yet).

Anyways, this seems to be a duplicate of
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX480 : random NULL pointer dereference on resume from su=
spend"
   href=3D"show_bug.cgi?id=3D111729#c7">https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111729#c7</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702136570.FaDB.18735--

--===============0719803531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0719803531==--
