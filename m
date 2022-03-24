Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49B4E5CE5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 02:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A587C10E02E;
	Thu, 24 Mar 2022 01:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 27DB610E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 01:48:27 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:53204.1700143801
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 731511002D6;
 Thu, 24 Mar 2022 09:48:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 dda94de79b974e819e1af598c879548f for robh@kernel.org; 
 Thu, 24 Mar 2022 09:48:26 CST
X-Transaction-ID: dda94de79b974e819e1af598c879548f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <ac75aeff-1fca-f46f-1043-8437ef845ff9@189.cn>
Date: Thu, 24 Mar 2022 09:48:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 5/7] dt-bindings: display: Add Loongson display
 controller
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-6-15330273260@189.cn>
 <YjkITWpbnCmhKaX+@robh.at.kernel.org>
 <f7eb61bc-6784-c77a-083f-7408c0a17e05@189.cn>
 <Yjo3umi9bJ0xb2Gl@robh.at.kernel.org>
 <199a2869-cd83-d24e-0ad0-25d15d76fc13@189.cn>
 <YjsamuFslv6qlQMZ@robh.at.kernel.org>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <YjsamuFslv6qlQMZ@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/23 21:03, Rob Herring wrote:
> On Wed, Mar 23, 2022 at 11:38:55AM +0800, Sui Jingfeng wrote:
>> On 2022/3/23 04:55, Rob Herring wrote:
>>> On Tue, Mar 22, 2022 at 10:33:45AM +0800, Sui Jingfeng wrote:
>>>> On 2022/3/22 07:20, Rob Herring wrote:
>>>>> On Tue, Mar 22, 2022 at 12:29:14AM +0800, Sui Jingfeng wrote:
>>>>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>>>>
>>>>> Needs a commit message.
>>>>>
>>>>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>>>>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>>>>> Same person? Don't need both emails.
>>>> Yes,  suijingfeng@loongson.cn is my company's email. But it can not be used
>>>> to send patches to dri-devel,
>>>>
>>>> when send patches with this email, the patch will not be shown on patch
>>>> works.
>>>>
>>>> Emails  are either blocked or got  rejected  by loongson's mail server.  It
>>>> can only receive emails
>>>>
>>>> from you and other people, but not dri-devel. so have to use my personal
>>>> email(15330273260@189.cn) to send patches.
>>>>
>>>>>> ---
>>>>>>     .../loongson/loongson,display-controller.yaml | 230 ++++++++++++++++++
>>>>>>     1 file changed, 230 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..7be63346289e
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>>>>> @@ -0,0 +1,230 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Loongson LS7A1000/LS2K1000/LS2K0500 Display Controller Device Tree Bindings
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>> +
>>>>>> +description: |+
>>>>>> +
>>>>>> +  Loongson display controllers are simple which require scanout buffers
>>>>>> +  to be physically contiguous. LS2K1000/LS2K0500 is a SOC, only system
>>>>>> +  memory is available. LS7A1000/LS7A2000 is bridge chip which is equipped
>>>>>> +  with a dedicated video RAM which is 64MB or more, precise size can be
>>>>>> +  read from the PCI BAR 2 of the GPU device(0x0014:0x7A15) in the bridge
>>>>>> +  chip.
>>>>>> +
>>>>>> +  LSDC has two display pipes, each way has a DVO interface which provide
>>>>>> +  RGB888 signals, vertical & horizontal synchronisations, data enable and
>>>>>> +  the pixel clock. LSDC has two CRTC, each CRTC is able to scanout from
>>>>>> +  1920x1080 resolution at 60Hz. Each CRTC has two FB address registers.
>>>>>> +
>>>>>> +  For LS7A1000, there are 4 dedicated GPIOs whose control register is
>>>>>> +  located at the DC register space. They are used to emulate two way i2c,
>>>>>> +  One for DVO0, another for DVO1.
>>>>>> +
>>>>>> +  LS2K1000 and LS2K0500 SoC grab i2c adapter from other module, either
>>>>>> +  general purpose GPIO emulated i2c or hardware i2c in the SoC.
>>>>>> +
>>>>>> +  LSDC's display pipeline have several components as below description,
>>>>>> +
>>>>>> +  The display controller in LS7A1000:
>>>>>> +     ___________________                                     _________
>>>>>> +    |            -------|                                   |         |
>>>>>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
>>>>>> +    |  _   _     -------|        ^             ^            |_________|
>>>>>> +    | | | | |    -------|        |             |
>>>>>> +    | |_| |_|    | i2c0 <--------+-------------+
>>>>>> +    |            -------|
>>>>>> +    |   DC IN LS7A1000  |
>>>>>> +    |  _   _     -------|
>>>>>> +    | | | | |    | i2c1 <--------+-------------+
>>>>>> +    | |_| |_|    -------|        |             |             _________
>>>>>> +    |            -------|        |             |            |         |
>>>>>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>>>>>> +    |            -------|                                   |_________|
>>>>>> +    |___________________|
>>>>>> +
>>>>>> +  Simple usage of LS7A1000 with LS3A4000 CPU:
>>>>>> +
>>>>>> +    +------+            +-----------------------------------+
>>>>>> +    | DDR4 |            |  +-------------------+            |
>>>>>> +    +------+            |  | PCIe Root complex |   LS7A1000 |
>>>>>> +       || MC0           |  +--++---------++----+            |
>>>>>> +  +----------+  HT 3.0  |     ||         ||                 |
>>>>>> +  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
>>>>>> +  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
>>>>>> +  +----------+          | +--------+  +-+--+-+    +---------+   +------+
>>>>>> +       || MC1           +---------------|--|----------------+
>>>>>> +    +------+                            |  |
>>>>>> +    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>>>>>> +    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
>>>>>> +                      +-------+                      +------+
>>>>>> +
>>>>>> +  The display controller in LS2K1000/LS2K0500:
>>>>>> +     ___________________                                     _________
>>>>>> +    |            -------|                                   |         |
>>>>>> +    |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
>>>>>> +    |  _   _     -------|        ^              ^           |_________|
>>>>>> +    | | | | |           |        |              |
>>>>>> +    | |_| |_|           |     +------+          |
>>>>>> +    |                   <---->| i2c0 |<---------+
>>>>>> +    |   DC IN LS2K1000  |     +------+
>>>>>> +    |  _   _            |     +------+
>>>>>> +    | | | | |           <---->| i2c1 |----------+
>>>>>> +    | |_| |_|           |     +------+          |            _________
>>>>>> +    |            -------|        |              |           |         |
>>>>>> +    |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
>>>>>> +    |            -------|                                   |_________|
>>>>>> +    |___________________|
>>>>>> +
>>>>>> +properties:
>>>>>> +  $nodename:
>>>>>> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
>>>>>> +
>>>>>> +  compatible:
>>>>>> +    oneOf:
>>>>>> +      - items:
>>>>>> +          - enum:
>>>>>> +              - loongson,ls7a1000-dc
>>>>>> +              - loongson,ls2k1000-dc
>>>>>> +              - loongson,ls2k0500-dc
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  '#address-cells':
>>>>>> +    const: 1
>>>>>> +
>>>>>> +  '#size-cells':
>>>>>> +    const: 0
>>>>>> +
>>>>>> +  i2c-gpio@0:
>>>>>> +    description: |
>>>>>> +      Built-in GPIO emulate i2c exported for external display bridge
>>>>> If you have i2c-gpio, that belongs at the DT top-level, not here.
>>>>>
>>>>>> +      configuration, onitor detection and edid read back etc, for ls7a1000
>>>>>> +      only. Its compatible must be lsdc,i2c-gpio-0. The reg property can be
>>>>> No, there's a defined i2c-gpio compatible already.
>>>> This is different from the i2c-gpio already defined under drivers/i2c/busses/i2c-gpio.c,
>>>> By design, my i2c-gpio is vendor specific properties, lsdc device driver create the i2c
>>>> adapter at runtime. These are 4 dedicated GPIOs whose control register is located at the
>>>> LSDC register space, not general purpose GPIOs with separate control register resource.
>>>> So i think it is the child node of display-controller@6,1, it belongs to LSDC.
>>>> It seems that put it at the DT top-level break the hierarchy and relationship.
>>> Okay, I see. Then just 'i2c' for the node names. You need a reference to
>>> i2c-controller.yaml for these nodes too.
>>>
>>> The compatible should not have an index in it.
>> OK, i will fix this at the next version. thanks.
>>>>>> +      used to specify a I2c adapter bus number, if you don't specify one
>>>>>> +      i2c driver core will dynamically assign a bus number. Please specify
>>>>> Bus numbers are a linux detail not relevant to DT binding.
>>>>>
>>>>>> +      it only when its bus number matters. Bus number greater than 6 is safe
>>>>>> +      because ls7a1000 bridge have 6 hardware I2C controller integrated.
>>>>>> +
>>>>>> +  i2c-gpio@1:
>>>>>> +    description: |
>>>>>> +      Built-in GPIO emulate i2c exported for external display bridge
>>>>>> +      configuration, onitor detection and edid read back etc, for ls7a1000
>>>>>> +      only. Its compatible must be lsdc,i2c-gpio-1.
>>>>>> +
>>>>>> +  ports:
>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>> +
>>>>>> +    properties:
>>>>>> +      port@0:
>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>> +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
>>>>>> +
>>>>>> +      port@1:
>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>> +        description: output port node connected with DPI panels or external encoders, with only one endpoint.
>>>>>> +
>>>>>> +    required:
>>>>>> +      - port@0
>>>>>> +      - port@1
>>>>>> +
>>>>>> +required:
>>>>>> +  - compatible
>>>>>> +  - reg
>>>>>> +  - interrupts
>>>>>> +  - ports
>>>>>> +
>>>>>> +additionalProperties: false
>>>>>> +
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>>> +    bus {
>>>>>> +
>>>>>> +        #address-cells = <3>;
>>>>>> +        #size-cells = <2>;
>>>>>> +        #interrupt-cells = <2>;
>>>>>> +
>>>>>> +        display-controller@6,1 {
>>>>>> +            compatible = "loongson,ls7a1000-dc";
>>>>>> +            reg = <0x3100 0x0 0x0 0x0 0x0>;
>>>>>> +            interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> +
>>>>>> +            #address-cells = <1>;
>>>>>> +            #size-cells = <0>;
>>>>>> +
>>>>>> +            i2c-gpio@0 {
>>>>>> +                compatible = "lsdc,i2c-gpio-0";
>>>>>> +                reg = <6>;
>>> 'reg' needs to be documented with some description of what 6 and 7
>>> represent. If they are the control register offset, then make the
>>> address translatable (use 'ranges' and define the size).
>> By design, the reg property is used to specify a I2c adapter bus number,
>> if we don't specify one, i2c driver core will dynamically assign a bus number.
>> then the nr of the i2c adapter will started from 0. I want is start from 6
>> to avoid potential conflict feature hardware I2C driver.
>>
>> Because LS7A1000 bridge chip have 6 hardware I2C controller integrated,
>> but its driver is not up-streamed yet. By default these hardware I2C controller's
>> nr is started from 0.
> Linux's numbering doesn't belong in DT. So no, you can't use 'reg' in
> that way.
Then,  can i use something like lsdc,nr = <6> ?
>> Even through i2c driver core can dynamically generate a number, i still want it
>> to be fixed and keep consistent and explicit. That is, i2c6 is for display pipe 0,
>> i2c7 is for display pipe 1. This follow the convention and flexible enough.
> You may want that, but that is not how the kernel works. Specific
> numbers are not guaranteed. I'm sure you've seen this for disks, network
> interfaces, etc.
>
> Rob

2c_bit_add_numbered_bus() will guarantee it for you as long as If no 
devices have pre-been declared for this bus.

you can read the comment of 2c_bit_add_numbered_bus() at 
drivers/i2c/i2c-core-base.c

