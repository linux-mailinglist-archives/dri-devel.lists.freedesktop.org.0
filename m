Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C139AAEA8D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 14:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CA56E8D1;
	Tue, 10 Sep 2019 12:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 286616E8D1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 12:37:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2494272167; Tue, 10 Sep 2019 12:37:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111232] 3200 Memory Crash  My System
Date: Tue, 10 Sep 2019 12:37:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: bibitocarlos@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111232-502-3aQatGo0GW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111232-502@http.bugs.freedesktop.org/>
References: <bug-111232-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1830970508=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1830970508==
Content-Type: multipart/alternative; boundary="15681190431.BCB8Fa.10334"
Content-Transfer-Encoding: 7bit


--15681190431.BCB8Fa.10334
Date: Tue, 10 Sep 2019 12:37:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111232

--- Comment #7 from bibitocarlos <bibitocarlos@gmail.com> ---
Created attachment 145321
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145321&action=3Dedit
dmesg

Tried this "amdgpu.ppfeaturemask=3D0xffff3fff" but iit doesnt work (from he=
re:
https://bugzilla.kernel.org/show_bug.cgi?id=3D204689).

Add new dmesg to check firmware version

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681190431.BCB8Fa.10334
Date: Tue, 10 Sep 2019 12:37:23 +0000
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
   title=3D"NEW - 3200 Memory Crash My System"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111232#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 3200 Memory Crash My System"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111232">bug 11123=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bibitocarlos&#64;gmail.com" title=3D"bibitocarlos &lt;bibitocarlos&#64;gmai=
l.com&gt;"> <span class=3D"fn">bibitocarlos</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145321=
" name=3D"attach_145321" title=3D"dmesg">attachment 145321</a> <a href=3D"a=
ttachment.cgi?id=3D145321&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

Tried this &quot;amdgpu.ppfeaturemask=3D0xffff3fff&quot; but iit doesnt wor=
k (from here:
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D204689">https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D204689</a>).

Add new dmesg to check firmware version</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681190431.BCB8Fa.10334--

--===============1830970508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1830970508==--
