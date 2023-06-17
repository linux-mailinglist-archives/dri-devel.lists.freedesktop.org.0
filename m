Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD1F734572
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FBE10E0E0;
	Sun, 18 Jun 2023 08:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 339 seconds by postgrey-1.36 at gabe;
 Sat, 17 Jun 2023 18:21:14 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CA710E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 18:21:14 +0000 (UTC)
Received: from [192.168.1.131] ([89.1.214.195]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N3Kc6-1q26EK0AFO-010Pfd; Sat, 17 Jun 2023 20:15:30 +0200
Message-ID: <5d2eb5af-b674-751b-1583-e048fbf8c3a5@mweigand.net>
Date: Sat, 17 Jun 2023 20:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] dt-bindings: backlight: lm3630a: add entries to
 control boost frequency
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Maximilian Weigand <mweigand2017@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
 <20230602-lm3630a_boost_frequency-v1-2-076472036d1a@mweigand.net>
 <17576d81-a342-0b77-367a-eb9f2b97b734@linaro.org> <7491264.lOV4Wx5bFT@diego>
 <c29b2b0c-2b0c-f79c-9de5-58a67edd5c87@linaro.org>
Content-Language: en-US
From: Maximilian Weigand <mweigand@mweigand.net>
In-Reply-To: <c29b2b0c-2b0c-f79c-9de5-58a67edd5c87@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bV9uqzgIsGllvko+cxd+BlB62CSSsLP5A90XEJ+9cqd1n+07lc+
 AfZkzBcAE+RV8jmhmYvi7ZBTU3W3R7AlJCe1I4Kn5uQTVqpj3r/ox+IW7poeTyFs4hLMuhj
 9XrXA3fiYg+eFkeddVpPQItFoaFs3iaHTpK5cl9PbjUYoKZHT0H24ESmlq9xEHyoBHU5ca1
 Bd+ymstKQAx8B71uT2pAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Hj9awCXPZ/8=;m20PRlYwOiu617GdGtB78KuTHOc
 ejKMExCp4cO81qCAeBB8p5+YCFhEuiFMRSX6W9vCROmoBaB39NyGt5sj5eJ/Xj6ECLmNSHg0n
 8kYjYQPMdc5OalP+3yYAMsnHPw/Hc/AJUm/AacaMcDh5qfGTqqLQH+IFrgsRl7WyKtkakka6e
 8BT1MY6yjhHmpsmWmNWzf8xAsa4kPBPeDAkpfqlFygvgkuJd26yHOUrlkM7fEa577DbaxVyH/
 QNS+JDiVJLmJI4g2NXqSGuOAqlXrDPG3Zh0X9bcYgAz4Cq5ESyVFFLQHsJT9Cw74xvWacBTem
 ICFYXM6NUa5jipbqW3Ie3yr0AEfJ5PMUFc5HqHBrzE1f8dYP2DgG2eAWV1nuKhHj5HUdlXdS/
 J8Qdu7tUYNRxCZh5jpLmzBdfBiPC/iW+fGEzWC3GhdL08nrpX/ObGBipmcvPGpLbRlf3ewMG5
 bcxoLJBbHuoYFw8i8Ul5p/KINltYQLic+ibgGHm9nATbKyqKxWg9/c/NFGXNa+j9rMP5c+Qyq
 aA2nNgsuUjR7t/VygpSl8VZSqQGpAYGbEyNvBM4xBZDIaRWHggy9hsYgo78uo7JQk6pXtxT5v
 X0oEbRxLvCXCcXLOCbqNwQL6oe76GmVdeWw0/o8hD8Du3I4+BZkH9k/ipqxipbFFJEZsLl574
 p5ZvDjfD5VBa6710TxiLQ8tyYFWypqgSeTeM7FuK9w==
X-Mailman-Approved-At: Sun, 18 Jun 2023 08:21:45 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17.06.23 19:42, Krzysztof Kozlowski wrote:
> On 17/06/2023 18:34, Heiko Stübner wrote:
>> Am Samstag, 17. Juni 2023, 12:12:17 CEST schrieb Krzysztof Kozlowski:
>>> On 14/06/2023 21:08, Maximilian Weigand wrote:
>>>> From: Maximilian Weigand <mweigand@mweigand.net>
>>>>
>>>> Add 'ti,boost_use_1mhz' to switch between 500 kHz and 1 MHz boost
>>>> converter switching frequency, and add 'ti,boost_frequency_shift' to
>>>> activate a frequency shift to 560 kHz or 1.12 MHz, respectively.
>>>>
>>>> Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
>>>> ---
>>>>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>>> index 3c9b4054ed9a..ef7ea0ad2d25 100644
>>>> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
>>>> @@ -33,6 +33,18 @@ properties:
>>>>      description: GPIO to use to enable/disable the backlight (HWEN pin).
>>>>      maxItems: 1
>>>>  
>>>> +  ti,boost_use_1mhz:
>>>
>>> No underscores in property names.
>>>
>>>> +    description: |
>>>
>>> Do not need '|' unless you need to preserve formatting.
>>>
>>>> +      If present, change the boost converter switching frequency from the
>>>> +      default 500 kHz to 1 MHz. Refer to data sheet for hardware requirements.
>>>> +    type: boolean
>>>> +
>>>> +  ti,boost_frequency_shift:
>>>> +    description: |
>>>> +      If present, change boost converter switching frequency from 500 kHz to
>>>> +      560 kHz or from 1 Mhz to 1.12 Mhz, respectively.
>>>
>>> So just make it a property choosing the frequency, not bools, with
>>> proper unit suffix.
>>
>> i.e.
>> ti,boost-frequency-hz = <x>;
>> with x being 500000, 560000, 1000000, 1120000
>>
>> with the driver failing when the frequency is not achievable
>> with the two knobs of 1mhz and shift.
> 
> Yeah, with a default value (500000, I guess).

Thanks for the feedback, this is quite obviously the better solution! I
will rework the submission accordingly.

Best regards

Maximilian

