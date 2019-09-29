Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF047C1919
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49389DF7;
	Sun, 29 Sep 2019 19:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B1056E320
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 19:25:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3860272162; Sun, 29 Sep 2019 19:25:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 29 Sep 2019 19:25:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: linedot@xcpp.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-110674-502-aKvdPjL1Ma@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0267815608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0267815608==
Content-Type: multipart/alternative; boundary="15697851502.2e0a.29001"
Content-Transfer-Encoding: 7bit


--15697851502.2e0a.29001
Date: Sun, 29 Sep 2019 19:25:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

linedot@xcpp.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linedot@xcpp.org

--- Comment #149 from linedot@xcpp.org ---
Created attachment 145581
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145581&action=3Dedit
5.3.1 plus Alex's patches, kde wayland crash, then kde xorg crash

This issue is not fixed for me with Alex's patches.

I use only a single monitor via DP. Running a patched 5.3.1 kernel. Attache=
d is
a dmesg log: First a wayland KDE session crashes, I kill all user processes=
 and
restart sddm and start a KDE Xorg session, which later also crashes.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15697851502.2e0a.29001
Date: Sun, 29 Sep 2019 19:25:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:linedot&#=
64;xcpp.org" title=3D"linedot&#64;xcpp.org">linedot&#64;xcpp.org</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>linedot&#64;xcpp.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c149">Comm=
ent # 149</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
linedot&#64;xcpp.org" title=3D"linedot&#64;xcpp.org">linedot&#64;xcpp.org</=
a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145581=
" name=3D"attach_145581" title=3D"5.3.1 plus Alex's patches, kde wayland cr=
ash, then kde xorg crash">attachment 145581</a> <a href=3D"attachment.cgi?i=
d=3D145581&amp;action=3Dedit" title=3D"5.3.1 plus Alex's patches, kde wayla=
nd crash, then kde xorg crash">[details]</a></span>
5.3.1 plus Alex's patches, kde wayland crash, then kde xorg crash

This issue is not fixed for me with Alex's patches.

I use only a single monitor via DP. Running a patched 5.3.1 kernel. Attache=
d is
a dmesg log: First a wayland KDE session crashes, I kill all user processes=
 and
restart sddm and start a KDE Xorg session, which later also crashes.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15697851502.2e0a.29001--

--===============0267815608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0267815608==--
