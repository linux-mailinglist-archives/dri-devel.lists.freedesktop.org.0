Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 894EAD90E3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 14:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78E6E95E;
	Wed, 16 Oct 2019 12:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB0DD6E95F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 12:29:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A82F47296E; Wed, 16 Oct 2019 12:29:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112033] Store the runner and kernel logs as part of the IGT
 results
Date: Wed, 16 Oct 2019 12:29:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: petri.latvala@intel.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-112033-502-4j9cI3xoi9@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112033-502@http.bugs.freedesktop.org/>
References: <bug-112033-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0524865374=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0524865374==
Content-Type: multipart/alternative; boundary="15712289832.0FFA89F1.2963"
Content-Transfer-Encoding: 7bit


--15712289832.0FFA89F1.2963
Date: Wed, 16 Oct 2019 12:29:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112033

Martin Peres <martin.peres@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|dri-devel@lists.freedesktop |petri.latvala@intel.com
                   |.org                        |

--- Comment #1 from Martin Peres <martin.peres@free.fr> ---
The rationale behind this request is to fix the lack of dmesg for resume ru=
ns'
after the machine reboots.

By fixing this in the runner, we end up fixing the issue for everyone
(individual developers, Intel CI, other CIs) which lead to less duplication=
 of
efforts.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712289832.0FFA89F1.2963
Date: Wed, 16 Oct 2019 12:29:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:martin.pe=
res&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <=
span class=3D"fn">Martin Peres</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Store the runner and kernel logs as part of the IGT resul=
ts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112033">bug 11203=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>petri.latvala&#64;intel.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Store the runner and kernel logs as part of the IGT resul=
ts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112033#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Store the runner and kernel logs as part of the IGT resul=
ts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112033">bug 11203=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>The rationale behind this request is to fix the lack of dmesg =
for resume runs'
after the machine reboots.

By fixing this in the runner, we end up fixing the issue for everyone
(individual developers, Intel CI, other CIs) which lead to less duplication=
 of
efforts.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712289832.0FFA89F1.2963--

--===============0524865374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0524865374==--
