Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1FCFE1B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFC9888AE;
	Tue,  8 Oct 2019 15:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C1C06E839
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:51:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 83A0272162; Tue,  8 Oct 2019 15:51:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111921] GPU crash on VegaM (amdgpu: The CS has been rejected)
Date: Tue, 08 Oct 2019 15:51:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rverschelde@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111921-502-Y55lX1UcBz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111921-502@http.bugs.freedesktop.org/>
References: <bug-111921-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1848037891=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1848037891==
Content-Type: multipart/alternative; boundary="15705498710.ca4dbc.17516"
Content-Transfer-Encoding: 7bit


--15705498710.ca4dbc.17516
Date: Tue, 8 Oct 2019 15:51:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111921

--- Comment #3 from R=C3=A9mi Verschelde <rverschelde@gmail.com> ---
I don't reset the GPU manually, no. I'm not sure why this happens, but I've=
 had
such output in dmesg as far as I can remember (since I got this laptop in
March).

For the reference, I've been using kernel 5.1.20 and did not experience this
crash. I'm not sure yet it's conclusive to say it's a regression though, I =
will
test more in coming days.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15705498710.ca4dbc.17516
Date: Tue, 8 Oct 2019 15:51:11 +0000
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
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921">bug 11192=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rverschelde&#64;gmail.com" title=3D"R=C3=A9mi Verschelde &lt;rverschelde&#6=
4;gmail.com&gt;"> <span class=3D"fn">R=C3=A9mi Verschelde</span></a>
</span></b>
        <pre>I don't reset the GPU manually, no. I'm not sure why this happ=
ens, but I've had
such output in dmesg as far as I can remember (since I got this laptop in
March).

For the reference, I've been using kernel 5.1.20 and did not experience this
crash. I'm not sure yet it's conclusive to say it's a regression though, I =
will
test more in coming days.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15705498710.ca4dbc.17516--

--===============1848037891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1848037891==--
