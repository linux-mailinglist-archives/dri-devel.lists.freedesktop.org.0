Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD8FCF30
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 21:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC606E3F3;
	Thu, 14 Nov 2019 20:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A4C96E3F3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 20:10:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 67232720E2; Thu, 14 Nov 2019 20:10:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112288] Blank display on Ubuntu 19.10 on Ryzen 3 2200G and
 Ryzen 5 2400G APUs
Date: Thu, 14 Nov 2019 20:10:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mortenkjeldgaard@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-112288-502-6YHQsRDKDT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112288-502@http.bugs.freedesktop.org/>
References: <bug-112288-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0281156459=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0281156459==
Content-Type: multipart/alternative; boundary="15737622131.695412.753"
Content-Transfer-Encoding: 7bit


--15737622131.695412.753
Date: Thu, 14 Nov 2019 20:10:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112288

--- Comment #5 from mortenkjeldgaard@gmail.com ---
Created attachment 145957
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145957&action=3Dedit
dmesg output

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15737622131.695412.753
Date: Thu, 14 Nov 2019 20:10:13 +0000
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
   title=3D"NEW - Blank display on Ubuntu 19.10 on Ryzen 3 2200G and Ryzen =
5 2400G APUs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112288#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Blank display on Ubuntu 19.10 on Ryzen 3 2200G and Ryzen =
5 2400G APUs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112288">bug 11228=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mortenkjeldgaard&#64;gmail.com" title=3D"mortenkjeldgaard&#64;gmail.com">mo=
rtenkjeldgaard&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145957=
" name=3D"attach_145957" title=3D"dmesg output">attachment 145957</a> <a hr=
ef=3D"attachment.cgi?id=3D145957&amp;action=3Dedit" title=3D"dmesg output">=
[details]</a></span>
dmesg output</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15737622131.695412.753--

--===============0281156459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0281156459==--
