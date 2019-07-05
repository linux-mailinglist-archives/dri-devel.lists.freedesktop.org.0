Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C295F26C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 07:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA66A6E25A;
	Thu,  4 Jul 2019 05:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 468196E260
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 05:52:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4316172167; Thu,  4 Jul 2019 05:52:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 106875] The game Anima Gate of Memories has artefects
Date: Thu, 04 Jul 2019 05:52:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Mesa core
X-Bugzilla-Version: 18.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: mesa-dev@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to qa_contact short_desc
Message-ID: <bug-106875-502-aKSqzzDSGd@http.bugs.freedesktop.org/>
In-Reply-To: <bug-106875-502@http.bugs.freedesktop.org/>
References: <bug-106875-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0469746963=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0469746963==
Content-Type: multipart/alternative; boundary="15622195773.6967DA.4517"
Content-Transfer-Encoding: 7bit


--15622195773.6967DA.4517
Date: Thu, 4 Jul 2019 05:52:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106875

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Drivers/Gallium/radeonsi    |Mesa core
           Assignee|dri-devel@lists.freedesktop |mesa-dev@lists.freedesktop.
                   |.org                        |org
         QA Contact|dri-devel@lists.freedesktop |mesa-dev@lists.freedesktop.
                   |.org                        |org
            Summary|The game Anima Gate of      |The game Anima Gate of
                   |Memories has artefects on   |Memories has artefects
                   |Vega 56                     |

--- Comment #2 from Timothy Arceri <t_arceri@yahoo.com.au> ---
I can confirm that my skylake machine running i965 has the same issues with
this game so moving this bug to the "Mesa core" component for now.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15622195773.6967DA.4517
Date: Thu, 4 Jul 2019 05:52:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - The game Anima Gate of Memories has artefects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106875">bug 10687=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Drivers/Gallium/radeonsi
           </td>
           <td>Mesa core
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>The game Anima Gate of Memories has artefects on Vega 56
           </td>
           <td>The game Anima Gate of Memories has artefects
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - The game Anima Gate of Memories has artefects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106875#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - The game Anima Gate of Memories has artefects"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106875">bug 10687=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>I can confirm that my skylake machine running i965 has the sam=
e issues with
this game so moving this bug to the &quot;Mesa core&quot; component for now=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15622195773.6967DA.4517--

--===============0469746963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0469746963==--
