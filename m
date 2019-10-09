Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA2D0D03
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293E6E971;
	Wed,  9 Oct 2019 10:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D2516E973
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:44:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 69D8472162; Wed,  9 Oct 2019 10:44:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111921] GPU crash on VegaM (amdgpu: The CS has been rejected)
Date: Wed, 09 Oct 2019 10:44:11 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111921-502-MCDZOYInFT@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1206043713=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1206043713==
Content-Type: multipart/alternative; boundary="15706178511.cDA1c.26795"
Content-Transfer-Encoding: 7bit


--15706178511.cDA1c.26795
Date: Wed, 9 Oct 2019 10:44:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111921

--- Comment #7 from R=C3=A9mi Verschelde <rverschelde@gmail.com> ---
Created attachment 145682
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145682&action=3Dedit
dmesg output running kernel 5.1.20 and resuming from screensaver, no bug

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15706178511.cDA1c.26795
Date: Wed, 9 Oct 2019 10:44:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921">bug 11192=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rverschelde&#64;gmail.com" title=3D"R=C3=A9mi Verschelde &lt;rverschelde&#6=
4;gmail.com&gt;"> <span class=3D"fn">R=C3=A9mi Verschelde</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145682=
" name=3D"attach_145682" title=3D"dmesg output running kernel 5.1.20 and re=
suming from screensaver, no bug">attachment 145682</a> <a href=3D"attachmen=
t.cgi?id=3D145682&amp;action=3Dedit" title=3D"dmesg output running kernel 5=
.1.20 and resuming from screensaver, no bug">[details]</a></span>
dmesg output running kernel 5.1.20 and resuming from screensaver, no bug</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15706178511.cDA1c.26795--

--===============1206043713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1206043713==--
