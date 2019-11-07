Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE7F3159
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8216F6B6;
	Thu,  7 Nov 2019 14:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 418FA6F6B6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 14:25:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 31EB1720E2; Thu,  7 Nov 2019 14:25:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112226] [HadesCanyon] GPU hangs don't anymore recover (although
 kernel still claims that they do)
Date: Thu, 07 Nov 2019 14:25:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: eero.t.tamminen@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-112226-502-32TQHGnoMa@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112226-502@http.bugs.freedesktop.org/>
References: <bug-112226-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0916325305=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0916325305==
Content-Type: multipart/alternative; boundary="15731367020.7053a44.7510"
Content-Transfer-Encoding: 7bit


--15731367020.7053a44.7510
Date: Thu, 7 Nov 2019 14:25:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112226

--- Comment #2 from Eero Tamminen <eero.t.tamminen@intel.com> ---
Created attachment 145908
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145908&action=3Dedit
dmesg

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731367020.7053a44.7510
Date: Thu, 7 Nov 2019 14:25:02 +0000
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
   title=3D"NEW - [HadesCanyon] GPU hangs don't anymore recover (although k=
ernel still claims that they do)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [HadesCanyon] GPU hangs don't anymore recover (although k=
ernel still claims that they do)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226">bug 11222=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eero.t.tamminen&#64;intel.com" title=3D"Eero Tamminen &lt;eero.t.tamminen&#=
64;intel.com&gt;"> <span class=3D"fn">Eero Tamminen</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145908=
" name=3D"attach_145908" title=3D"dmesg">attachment 145908</a> <a href=3D"a=
ttachment.cgi?id=3D145908&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731367020.7053a44.7510--

--===============0916325305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0916325305==--
