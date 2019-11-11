Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F1F7137
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252CB6E892;
	Mon, 11 Nov 2019 09:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68A026E891
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:53:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 65185720E2; Mon, 11 Nov 2019 09:53:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111329] [CI][SHARDS] igt@gem_ctx_isolation@vcs1-nonpriv - fail
 - igt@gem_ctx_isolation@vcs1-nonpriv - fail - Failed assertion: num_errors ==
 0, registers mistached between nonpriv read/writes
Date: Mon, 11 Nov 2019 09:53:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: francesco.balestrieri@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to component qa_contact
Message-ID: <bug-111329-502-bQtciDSei7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111329-502@http.bugs.freedesktop.org/>
References: <bug-111329-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1834620854=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1834620854==
Content-Type: multipart/alternative; boundary="15734660372.a8Fd.1009"
Content-Transfer-Encoding: 7bit


--15734660372.a8Fd.1009
Date: Mon, 11 Nov 2019 09:53:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111329

Francesco Balestrieri <francesco.balestrieri@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|intel-gfx-bugs@lists.freede |dri-devel@lists.freedesktop
                   |sktop.org                   |.org
          Component|DRM/Intel                   |IGT
         QA Contact|intel-gfx-bugs@lists.freede |
                   |sktop.org                   |

--- Comment #8 from Francesco Balestrieri <francesco.balestrieri@intel.com>=
 ---
Based on off-line discussion, it appears that this needs to be fixed in IGT.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734660372.a8Fd.1009
Date: Mon, 11 Nov 2019 09:53:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:francesco=
.balestrieri&#64;intel.com" title=3D"Francesco Balestrieri &lt;francesco.ba=
lestrieri&#64;intel.com&gt;"> <span class=3D"fn">Francesco Balestrieri</spa=
n></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;gem_ctx_isolation&#64;vcs1-nonpriv -=
 fail - igt&#64;gem_ctx_isolation&#64;vcs1-nonpriv - fail - Failed assertio=
n: num_errors =3D=3D 0, registers mistached between nonpriv read/writes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111329">bug 11132=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>DRM/Intel
           </td>
           <td>IGT
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;gem_ctx_isolation&#64;vcs1-nonpriv -=
 fail - igt&#64;gem_ctx_isolation&#64;vcs1-nonpriv - fail - Failed assertio=
n: num_errors =3D=3D 0, registers mistached between nonpriv read/writes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111329#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][SHARDS] igt&#64;gem_ctx_isolation&#64;vcs1-nonpriv -=
 fail - igt&#64;gem_ctx_isolation&#64;vcs1-nonpriv - fail - Failed assertio=
n: num_errors =3D=3D 0, registers mistached between nonpriv read/writes"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111329">bug 11132=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
francesco.balestrieri&#64;intel.com" title=3D"Francesco Balestrieri &lt;fra=
ncesco.balestrieri&#64;intel.com&gt;"> <span class=3D"fn">Francesco Balestr=
ieri</span></a>
</span></b>
        <pre>Based on off-line discussion, it appears that this needs to be=
 fixed in IGT.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734660372.a8Fd.1009--

--===============1834620854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1834620854==--
