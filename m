Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E93871C17
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A1B112A19;
	Tue,  5 Mar 2024 10:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hLyTDs6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC300112A0F;
 Tue,  5 Mar 2024 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K3yp7C0pQ7ldKDkCbhOar0UBhiv6KJOFunnEtqi5GAQ=; b=hLyTDs6CWwg/1gSgwVj9cG+Zt/
 zG352kTlF22EQDBx6hJJgWpdGRZX0WUi+LuLMAFlSwHDwVZjMnYfLpBpTHCsG5zCw6laVqDXjXneN
 eeXH4QvEVtbdjcRD7ytwQ18t1bOfhHDeQw9m8dQRbBSjUGym9AZNCnr2FxE33p3XtT/UbJzeaSw9/
 BfWecHt2BCw0BXEv3Z0z0V23KDLBFHd8Gj81gEYlhW3GsTaIeRMd/G4Dnb9ZpAOOjKuaRWaJBK2hr
 emrsI0r8sbGN5R07Zt5GhyJw80LsLxKxD2bGtFXz2mIijYDhpgtRwmqX2jvx26LOY/GQm0rCk5K5o
 9PHPnVbQ==;
Received: from c-71-59-88-35.hsd1.nj.comcast.net ([71.59.88.35]
 helo=[192.168.1.99]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rhSMX-006CeC-Jf; Tue, 05 Mar 2024 11:49:33 +0100
Content-Type: multipart/alternative;
 boundary="------------PUCnCxgdF0nKqUJPe2Gx1RhO"
Message-ID: <39fac3a4-f9de-4968-b0ff-ac3bf503a4fb@igalia.com>
Date: Tue, 5 Mar 2024 05:49:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Reminder: 2024 X.Org Board of Directors Elections timeline extended, 
 request for nominations
Content-Language: en-US
From: Christopher Michael <cmichael@igalia.com>
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
Cc: board <board@foundation.x.org>
References: <0efcdfe3-ea9e-43e5-ab07-6d69dca2c04a@igalia.com>
 <08f8a967-25e1-4362-be38-3f1b050ec6f2@igalia.com>
In-Reply-To: <08f8a967-25e1-4362-be38-3f1b050ec6f2@igalia.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------PUCnCxgdF0nKqUJPe2Gx1RhO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This is a reminder that we are still looking for candidates for the 
upcoming X.Org Board of Directors elections, and that membership 
renewals are still open and will be needed to vote on those elections. 
Please read below for more details.


Cheers,

Christopher Michael, on behalf of the X.Org BoD


On 3/1/24 06:25, Christopher Michael wrote:
>
> We are seeking nominations for candidates for election to the X.org 
> Foundation Board of Directors. However, as we presently do not have 
> enough nominations to start the election - the decision has been made 
> to extend the timeline by 2 weeks. Note this is a fairly regular part 
> of the elections process.
>
>
> The new deadline for nominations to the X.org Board of Directors is 
> 23:59 UTC on 11 March 2024
>
>
> The Board consists of directors elected from the membership. Each 
> year, an election is held to bring the total number of directors to 
> eight. The four members receiving the highest vote totals will serve 
> as directors for two year terms.
>
> The directors who received two year terms starting in 2023 were 
> Arkadiusz Hiler, Christopher Michael, Lyude Paul, and Daniel Vetter. 
> They will continue to serve until their term ends in 2024. Current 
> directors whose term expires in 2024 are Emma Anholt, Mark Filion, 
> Ricardo Garcia, and Alyssa Rosenzweig.
> <https://rosenzweig.io/>
>
> A director is expected to participate in the fortnightly IRC meeting 
> to discuss current business and to attend the annual meeting of the 
> X.Org Foundation, which will be held at a location determined in 
> advance by the Board of Directors.
>
> A member may nominate themselves or any other member they feel is 
> qualified. Nominations should be sent to the Election Committee at 
> elections@x.org.
>
> Nominees shall be required to be current members of the X.Org 
> Foundation, and submit a personal statement of up to 200 words that 
> will be provided to prospective voters. The collected statements, 
> along with the statement of contribution to the X.Org Foundation in 
> the member's account page on http://members.x.org, will be made 
> available to all voters to help them make their voting decisions.
>
> Nominations and completed personal statements must be received no 
> later than 23:59 UTC on 11 March 2024.
>
> The slate of candidates will be published 18 March 2024 and candidate 
> Q&A will begin then. The deadline for Xorg membership applications and 
> renewals has also been extended 2 weeks and is now 25 March 2024.
>
>
> Cheers,
>
> Christopher Michael, on behalf of the X.Org BoD
>
>
--------------PUCnCxgdF0nKqUJPe2Gx1RhO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>This is a reminder that we are still looking for candidates for
      the upcoming X.Org Board of Directors elections, and that
      membership renewals are still open and will be needed to vote on
      those elections. Please read below for more details. <br>
    </p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Christopher Michael, on behalf of the X.Org BoD</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/1/24 06:25, Christopher Michael
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:08f8a967-25e1-4362-be38-3f1b050ec6f2@igalia.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>We are seeking nominations for candidates for election to the
        X.org Foundation Board of Directors. However, as we presently do
        not have enough nominations to start the election - the decision
        has been made to extend the timeline by 2 weeks. Note this is a
        fairly regular part of the elections process.</p>
      <p><br>
      </p>
      <p>The new deadline for nominations to the X.org Board of
        Directors is 23:59 UTC on 11 March 2024</p>
      <br>
      The Board consists of directors elected from the membership. Each
      year, an election is held to bring the total number of directors
      to eight. The four members receiving the highest vote totals will
      serve as directors for two year terms.
      <p>The directors who received two year terms starting in 2023 were
        <span class="createlink">Arkadiusz Hiler, </span><span
          class="createlink">Christopher Michael, </span><span
          class="createlink">Lyude Paul, and Daniel Vetter</span>. They
        will continue to serve until their term ends in 2024. Current
        directors whose term expires in 2024 are <span
          class="createlink">Emma Anholt, </span><span
          class="createlink">Mark Filion, </span><span
          class="createlink">Ricardo Garcia, and Alyssa Rosenzweig.</span><a
          href="https://rosenzweig.io/" moz-do-not-send="true"><br>
        </a></p>
      <p>A director is expected to participate in the fortnightly IRC
        meeting to discuss current business and to attend the annual
        meeting of the X.Org Foundation, which will be held at a
        location determined in advance by the Board of Directors.</p>
      <p>A member may nominate themselves or any other member they feel
        is qualified. Nominations should be sent to the Election
        Committee at <a
          class="moz-txt-link-abbreviated moz-txt-link-freetext"
          href="mailto:elections@x.org" moz-do-not-send="true">elections@x.org</a>.<br>
      </p>
      <p>Nominees shall be required to be current members of the X.Org
        Foundation, and submit a personal statement of up to 200 words
        that will be provided to prospective voters. The collected
        statements, along with the statement of contribution to the
        X.Org Foundation in the member's account page on <a
          class="moz-txt-link-freetext" href="http://members.x.org"
          moz-do-not-send="true">http://members.x.org</a>, will be made
        available to all voters to help them make their voting
        decisions.</p>
      <p>Nominations and completed personal statements must be received
        no later than 23:59 UTC on 11 March 2024.</p>
      <p>The slate of candidates will be published 18 March 2024 and
        candidate Q&amp;A will begin then. The deadline for Xorg
        membership applications and renewals has also been extended 2
        weeks and is now 25 March 2024.</p>
      <p><br>
      </p>
      <p>Cheers,</p>
      <p>Christopher Michael, on behalf of the X.Org BoD</p>
      <p><br>
      </p>
    </blockquote>
  </body>
</html>

--------------PUCnCxgdF0nKqUJPe2Gx1RhO--
