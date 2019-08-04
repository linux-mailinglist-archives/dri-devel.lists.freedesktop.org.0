Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A653380BC7
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 19:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24E489E59;
	Sun,  4 Aug 2019 17:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDB3C89E59
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 17:07:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DA39F72167; Sun,  4 Aug 2019 17:07:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108641] Interlaced dark lines in XCOM2 (UE3.5) on Aruba and Turks
Date: Sun, 04 Aug 2019 17:07:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r600
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steelwinged@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-108641-502-CaGH0eK7QR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108641-502@http.bugs.freedesktop.org/>
References: <bug-108641-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1979763568=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1979763568==
Content-Type: multipart/alternative; boundary="15649384290.1BBC829.1342"
Content-Transfer-Encoding: 7bit


--15649384290.1BBC829.1342
Date: Sun, 4 Aug 2019 17:07:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108641

--- Comment #4 from steelwinged@gmail.com ---
Created attachment 144946
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144946&action=3Dedit
Shader suspected of causing defect

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15649384290.1BBC829.1342
Date: Sun, 4 Aug 2019 17:07:09 +0000
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
   title=3D"NEW - Interlaced dark lines in XCOM2 (UE3.5) on Aruba and Turks"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108641#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Interlaced dark lines in XCOM2 (UE3.5) on Aruba and Turks"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108641">bug 10864=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
steelwinged&#64;gmail.com" title=3D"steelwinged&#64;gmail.com">steelwinged&=
#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144946=
" name=3D"attach_144946" title=3D"Shader suspected of causing defect">attac=
hment 144946</a> <a href=3D"attachment.cgi?id=3D144946&amp;action=3Dedit" t=
itle=3D"Shader suspected of causing defect">[details]</a></span>
Shader suspected of causing defect</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15649384290.1BBC829.1342--

--===============1979763568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1979763568==--
