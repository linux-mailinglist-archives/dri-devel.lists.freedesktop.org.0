Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0EC456D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 03:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA6A6E5C0;
	Wed,  2 Oct 2019 01:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F16286E5C0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 01:21:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EDBAE72162; Wed,  2 Oct 2019 01:21:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111846] Suspend to RAM cause screen to glitch on navi10
Date: Wed, 02 Oct 2019 01:21:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yshuiv7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111846-502-mtxaRsjt3W@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111846-502@http.bugs.freedesktop.org/>
References: <bug-111846-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1003409624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1003409624==
Content-Type: multipart/alternative; boundary="15699792901.a332d721.25737"
Content-Transfer-Encoding: 7bit


--15699792901.a332d721.25737
Date: Wed, 2 Oct 2019 01:21:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111846

--- Comment #3 from Yuxuan Shui <yshuiv7@gmail.com> ---
Created attachment 145611
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145611&action=3Dedit
Xorg.0.log (has a couple of suspension/hibernation)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15699792901.a332d721.25737
Date: Wed, 2 Oct 2019 01:21:30 +0000
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
   title=3D"NEW - Suspend to RAM cause screen to glitch on navi10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111846#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Suspend to RAM cause screen to glitch on navi10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111846">bug 11184=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yshuiv7&#64;gmail.com" title=3D"Yuxuan Shui &lt;yshuiv7&#64;gmail.com&gt;">=
 <span class=3D"fn">Yuxuan Shui</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145611=
" name=3D"attach_145611" title=3D"Xorg.0.log (has a couple of suspension/hi=
bernation)">attachment 145611</a> <a href=3D"attachment.cgi?id=3D145611&amp=
;action=3Dedit" title=3D"Xorg.0.log (has a couple of suspension/hibernation=
)">[details]</a></span>
Xorg.0.log (has a couple of suspension/hibernation)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15699792901.a332d721.25737--

--===============1003409624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1003409624==--
